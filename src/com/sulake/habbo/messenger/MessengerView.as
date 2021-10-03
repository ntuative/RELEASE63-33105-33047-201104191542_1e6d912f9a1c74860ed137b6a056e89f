package com.sulake.habbo.messenger
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.SendMsgMessageComposer;
   import com.sulake.habbo.messenger.domain.Conversation;
   import com.sulake.habbo.messenger.domain.Message;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.TimerEvent;
   import flash.ui.Keyboard;
   import flash.utils.Timer;
   
   public class MessengerView implements IDisposable
   {
       
      
      private var var_145:HabboMessenger;
      
      private var var_932:ConversationsTabView;
      
      private var var_904:ITextFieldWindow;
      
      private var var_15:IFrameWindow;
      
      private var var_1435:ConversationView;
      
      private var var_501:Timer;
      
      private var _disposed:Boolean = false;
      
      public function MessengerView(param1:HabboMessenger)
      {
         super();
         this.var_145 = param1;
         this.var_501 = new Timer(300,1);
         this.var_501.addEventListener(TimerEvent.TIMER,this.onResizeTimer);
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            if(this.var_501)
            {
               this.var_501.stop();
               this.var_501.removeEventListener(TimerEvent.TIMER,this.onResizeTimer);
               this.var_501 = null;
            }
            this.var_145 = null;
            this._disposed = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function isMessengerOpen() : Boolean
      {
         return this.var_15 != null && this.var_15.visible;
      }
      
      public function close() : void
      {
         if(this.var_15 != null)
         {
            this.var_15.visible = false;
         }
      }
      
      public function openMessenger() : void
      {
         if(this.var_145.conversations.openConversations.length < 1)
         {
            return;
         }
         if(this.var_15 == null)
         {
            this.prepareContent();
            this.refresh();
            this.var_145.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_58,HabboToolbarIconEnum.MESSENGER,this.var_15));
         }
         else
         {
            this.refresh();
            this.var_15.visible = true;
            this.var_15.activate();
         }
      }
      
      public function refresh() : void
      {
         if(this.var_15 == null)
         {
            return;
         }
         var _loc1_:Conversation = this.var_145.conversations.findSelectedConversation();
         this.var_15.caption = _loc1_ == null ? "" : _loc1_.name;
         this.var_932.refresh();
         this.var_1435.refresh();
         if(this.var_145.conversations.openConversations.length < 1)
         {
            this.var_15.visible = false;
            this.var_145.setHabboToolbarIcon(false,false);
         }
      }
      
      public function addMsgToView(param1:Conversation, param2:Message) : void
      {
         if(this.var_15 == null)
         {
            return;
         }
         if(!param1.selected)
         {
            return;
         }
         this.var_1435.addMessage(param2);
      }
      
      private function prepareContent() : void
      {
         this.var_15 = IFrameWindow(this.var_145.getXmlWindow("main_window"));
         var _loc1_:IWindow = this.var_15.findChildByTag("close");
         _loc1_.procedure = this.onWindowClose;
         this.var_15.procedure = this.onWindow;
         this.var_15.title.color = 4294623744;
         this.var_15.title.textColor = 4287851525;
         this.var_932 = new ConversationsTabView(this.var_145,this.var_15);
         this.var_932.refresh();
         this.var_904 = ITextFieldWindow(this.var_15.findChildByName("message_input"));
         this.var_904.addEventListener(WindowKeyboardEvent.const_176,this.onMessageInput);
         this.var_1435 = new ConversationView(this.var_145,this.var_15);
         this.var_15.scaler.setParamFlag(HabboWindowParam.const_872,false);
         this.var_15.scaler.setParamFlag(HabboWindowParam.const_1276,true);
         this.var_15.center();
      }
      
      private function onMessageInput(param1:WindowKeyboardEvent) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc2_:IWindow = IWindow(param1.target);
         if(param1.charCode == Keyboard.ENTER)
         {
            this.sendMsg();
         }
         else
         {
            _loc3_ = 120;
            _loc4_ = this.var_904.text;
            if(_loc4_.length > _loc3_)
            {
               this.var_904.text = _loc4_.substring(0,_loc3_);
            }
         }
      }
      
      private function onWindow(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_41 || param2 != this.var_15)
         {
            return;
         }
         if(!this.var_501.running)
         {
            this.var_501.reset();
            this.var_501.start();
         }
      }
      
      private function onResizeTimer(param1:TimerEvent) : void
      {
         Logger.log("XXX RESIZE XXX");
         this.var_1435.afterResize();
         this.var_932.refresh();
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Close window");
         this.var_15.visible = false;
      }
      
      private function sendMsg() : void
      {
         var _loc1_:String = this.var_904.text;
         Logger.log("Send msg: " + _loc1_);
         if(_loc1_ == "")
         {
            Logger.log("No text...");
            return;
         }
         var _loc2_:Conversation = this.var_145.conversations.findSelectedConversation();
         if(_loc2_ == null)
         {
            Logger.log("No conversation...");
            return;
         }
         this.var_145.send(new SendMsgMessageComposer(_loc2_.id,_loc1_));
         if(_loc2_.messages.length == 1)
         {
            this.var_145.playSendSound();
         }
         this.var_904.text = "";
         this.var_145.conversations.addMessageAndUpdateView(new Message(Message.const_902,_loc2_.id,_loc1_,Util.getFormattedNow()));
      }
      
      public function getTabCount() : int
      {
         return this.var_932 == null ? 7 : int(this.var_932.getTabCount());
      }
   }
}
