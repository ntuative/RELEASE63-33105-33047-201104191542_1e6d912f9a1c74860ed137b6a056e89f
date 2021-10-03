package com.sulake.habbo.widget.chatinput
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ILocalization;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.messages.RoomWidgetChatMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetChatTypingMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.InteractiveObject;
   import flash.display.Stage;
   import flash.events.KeyboardEvent;
   import flash.events.TimerEvent;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.ui.Keyboard;
   import flash.utils.Timer;
   
   public class RoomChatInputViewOld
   {
      
      private static const const_1409:int = 11;
      
      private static const const_653:int = 18;
      
      private static const const_1024:int = 16;
      
      private static const const_1408:int = 20;
      
      private static const LEFT:String = "left";
      
      private static const CENTER:String = "middle";
      
      private static const RIGHT:String = "right";
      
      private static const INPUT:String = "chat_input";
       
      
      private var _widget:RoomChatInputWidgetOld;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _window:IWindowContainer;
      
      private var _localization:IHabboLocalizationManager;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_1440:int = 0;
      
      private var _chatModeIdShout:String;
      
      private var var_1168:String;
      
      private var var_2410:String;
      
      private var var_304:Number = 600;
      
      private var var_1439:Boolean = false;
      
      private var var_620:Boolean = false;
      
      private var var_1442:Boolean = false;
      
      private var var_354:Timer;
      
      private var var_420:Timer;
      
      private var var_502:String = "";
      
      public function RoomChatInputViewOld(param1:RoomChatInputWidgetOld, param2:IHabboWindowManager, param3:IAssetLibrary, param4:IHabboLocalizationManager)
      {
         super();
         this._widget = param1;
         this._windowManager = param2;
         this._assetLibrary = param3;
         this._localization = param4;
         this.var_1168 = this._localization.getKey("widgets.chatinput.mode.whisper",":tell");
         this._chatModeIdShout = this._localization.getKey("widgets.chatinput.mode.shout",":shout");
         this.var_2410 = this._localization.getKey("widgets.chatinput.mode.speak",":speak");
         this.var_354 = new Timer(1000,1);
         this.var_354.addEventListener(TimerEvent.TIMER_COMPLETE,this.onTypingTimerComplete);
         this.var_420 = new Timer(10000,1);
         this.var_420.addEventListener(TimerEvent.TIMER_COMPLETE,this.onIdleTimerComplete);
         this.createWindow();
      }
      
      public function get window() : IWindowContainer
      {
         return this._window;
      }
      
      public function dispose() : void
      {
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
         this._widget = null;
         this._windowManager = null;
         this._localization = null;
         this._assetLibrary = null;
         if(this.var_354 != null)
         {
            this.var_354.reset();
            this.var_354.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onTypingTimerComplete);
            this.var_354 = null;
         }
         if(this.var_420 != null)
         {
            this.var_420.reset();
            this.var_420.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onIdleTimerComplete);
            this.var_420 = null;
         }
      }
      
      public function hideView() : void
      {
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
      }
      
      private function createWindow() : void
      {
         if(this._window != null)
         {
            this.refreshView();
            return;
         }
         var _loc2_:XmlAsset = this._assetLibrary.getAssetByName("chatinput_window_old") as XmlAsset;
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.content == null)
         {
            return;
         }
         this._window = this._windowManager.buildFromXML(_loc2_.content as XML) as IWindowContainer;
         this._window.tags.push("room_widget_chatinput");
         var _loc3_:IBitmapWrapperWindow = this._window.findChildByName(LEFT) as IBitmapWrapperWindow;
         var _loc4_:IBitmapWrapperWindow = this._window.findChildByName(CENTER) as IBitmapWrapperWindow;
         var _loc5_:IBitmapWrapperWindow = this._window.findChildByName(RIGHT) as IBitmapWrapperWindow;
         var _loc6_:ITextFieldWindow = this._window.findChildByName(INPUT) as ITextFieldWindow;
         var _loc7_:IAsset = this._assetLibrary.getAssetByName(_loc3_.bitmapAssetName);
         var _loc8_:IAsset = this._assetLibrary.getAssetByName(_loc4_.bitmapAssetName);
         var _loc9_:IAsset = this._assetLibrary.getAssetByName(_loc5_.bitmapAssetName);
         _loc3_.bitmap = _loc7_.content as BitmapData;
         _loc3_.disposesBitmap = false;
         _loc4_.bitmap = _loc8_.content as BitmapData;
         _loc4_.disposesBitmap = false;
         _loc5_.bitmap = _loc9_.content as BitmapData;
         _loc5_.disposesBitmap = false;
         this.addEventListenerToChild(_loc3_);
         this.addEventListenerToChild(_loc4_);
         this.addEventListenerToChild(_loc5_);
         this.addEventListenerToChild(_loc6_);
         _loc6_.addEventListener(WindowKeyboardEvent.const_176,this.windowKeyEventProcessor);
         _loc6_.addEventListener(WindowEvent.const_104,this.onInputChanged);
         this._window.addEventListener(WindowEvent.const_237,this.onWindowMoved);
         this.var_1439 = true;
         this.var_502 = "";
         this.refreshView();
      }
      
      private function refreshView() : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc1_:ITextFieldWindow = this._window.findChildByName(INPUT) as ITextFieldWindow;
         this._window.width = _loc1_.width + const_653 + const_1024;
         _loc1_.x = const_653;
         _loc1_.y = const_1409;
      }
      
      public function setMaxWidth(param1:Number) : void
      {
         this.var_304 = param1 - (const_653 + const_1024);
         this.checkInputFieldLimits();
      }
      
      public function hideFloodBlocking() : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc1_:ITextFieldWindow = this._window.findChildByName(INPUT) as ITextFieldWindow;
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.enable();
         _loc1_.selectable = true;
         _loc1_.text = "";
         this.var_502 = "";
         this.setInputFieldFocus();
         this.checkInputFieldLimits();
      }
      
      public function showFloodBlocking(param1:int) : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc2_:ITextFieldWindow = this._window.findChildByName(INPUT) as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.disable();
         _loc2_.selectable = false;
         this._localization.registerParameter("chat.input.alert.flood","time",param1.toString());
         var _loc3_:ILocalization = this._localization.getLocalization("chat.input.alert.flood");
         var _loc4_:String = "";
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.value;
         }
         _loc2_.text = _loc4_;
         this.setInputFieldUnFocus();
         this.refreshView();
      }
      
      public function displaySpecialChatMessage(param1:String, param2:String = "") : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc3_:ITextFieldWindow = this._window.findChildByName(INPUT) as ITextFieldWindow;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.enable();
         _loc3_.selectable = true;
         _loc3_.text = "";
         this.setInputFieldFocus();
         _loc3_.text += param1 + " ";
         if(param2.length > 0)
         {
            _loc3_.text += param2 + " ";
         }
         _loc3_.setSelection(_loc3_.text.length,_loc3_.text.length);
         this.var_502 = _loc3_.text;
         this.checkInputFieldLimits();
      }
      
      private function addEventListenerToChild(param1:IWindow) : void
      {
         if(param1 != null)
         {
            param1.setParamFlag(HabboWindowParam.const_38,true);
            param1.addEventListener(WindowMouseEvent.const_42,this.windowMouseEventProcessor);
         }
      }
      
      private function windowMouseEventProcessor(param1:WindowEvent = null, param2:IWindow = null) : void
      {
         this.setInputFieldFocus();
      }
      
      private function windowKeyEventProcessor(param1:WindowEvent = null, param2:IWindow = null) : void
      {
         var _loc4_:* = 0;
         var _loc5_:Boolean = false;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         if(this._window == null || this._widget == null || this._widget.floodBlocked)
         {
            return;
         }
         if(this.anotherFieldHasFocus())
         {
            return;
         }
         var _loc3_:int = this.var_1440;
         this.setInputFieldFocus();
         if(param1 is WindowKeyboardEvent)
         {
            _loc6_ = param1 as WindowKeyboardEvent;
            _loc4_ = uint(_loc6_.charCode);
            _loc5_ = _loc6_.shiftKey;
         }
         if(param1 is KeyboardEvent)
         {
            _loc7_ = param1 as KeyboardEvent;
            _loc4_ = uint(_loc7_.charCode);
            _loc5_ = _loc7_.shiftKey;
         }
         if(_loc7_ == null && _loc6_ == null)
         {
            return;
         }
         if(_loc5_)
         {
            _loc3_ = 0;
         }
         if(_loc4_ == Keyboard.SPACE)
         {
            this.checkSpecialKeywordForInput();
         }
         if(_loc4_ == Keyboard.ENTER)
         {
            this.sendChatFromInputField(_loc3_);
         }
         if(_loc4_ == Keyboard.BACKSPACE)
         {
            _loc8_ = this._window.findChildByName(INPUT) as ITextFieldWindow;
            if(_loc8_ != null)
            {
               _loc9_ = _loc8_.text;
               _loc10_ = _loc9_.split(" ");
               if(_loc10_[0] == this.var_1168 && _loc10_.length == 3 && _loc10_[2] == "")
               {
                  _loc8_.text = "";
                  this.var_502 = "";
               }
            }
         }
      }
      
      private function onWindowMoved(param1:WindowEvent) : void
      {
         if(this._window == null)
         {
            return;
         }
         this.setMaxWidth(this._window.context.getDesktopWindow().width - this._window.x - const_1408);
      }
      
      private function onInputChanged(param1:WindowEvent) : void
      {
         var _loc2_:ITextFieldWindow = param1.window as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         this.var_420.reset();
         var _loc3_:* = _loc2_.text.length == 0;
         if(_loc3_)
         {
            this.var_620 = false;
            this.var_354.start();
         }
         else
         {
            if(_loc2_.text.length > this.var_502.length + 1)
            {
               if(this._widget.allowPaste)
               {
                  this._widget.setLastPasteTime();
               }
               else
               {
                  _loc2_.text = "";
               }
            }
            this.var_502 = _loc2_.text;
            if(!this.var_620)
            {
               this.var_620 = true;
               this.var_354.reset();
               this.var_354.start();
            }
            this.var_420.start();
            this.checkInputFieldLimits();
         }
      }
      
      private function checkSpecialKeywordForInput() : void
      {
         var _loc1_:ITextFieldWindow = this._window.findChildByName(INPUT) as ITextFieldWindow;
         if(_loc1_ == null)
         {
            return;
         }
         if(_loc1_.text == "")
         {
            return;
         }
         var _loc2_:String = _loc1_.text;
         var _loc3_:String = this._widget.selectedUserName;
         if(_loc2_ == this.var_1168)
         {
            if(_loc3_.length > 0)
            {
               _loc1_.text += " " + this._widget.selectedUserName;
               _loc1_.setSelection(_loc1_.text.length,_loc1_.text.length);
               this.var_502 = _loc1_.text;
            }
         }
      }
      
      private function onIdleTimerComplete(param1:TimerEvent) : void
      {
         if(this.var_620)
         {
            this.var_1442 = false;
         }
         this.var_620 = false;
         this.sendTypingMessage();
      }
      
      private function onTypingTimerComplete(param1:TimerEvent) : void
      {
         if(this.var_620)
         {
            this.var_1442 = true;
         }
         this.sendTypingMessage();
      }
      
      private function sendTypingMessage() : void
      {
         if(this._widget == null)
         {
            return;
         }
         if(this._widget.floodBlocked)
         {
            return;
         }
         var _loc1_:RoomWidgetChatTypingMessage = new RoomWidgetChatTypingMessage(this.var_620);
         this._widget.messageListener.processWidgetMessage(_loc1_);
      }
      
      private function checkInputFieldLimits() : void
      {
         var _loc1_:ITextFieldWindow = this._window.findChildByName(INPUT) as ITextFieldWindow;
         if(_loc1_ == null)
         {
            return;
         }
         if(_loc1_.textWidth >= this.var_304)
         {
            if(_loc1_.autoSize != TextFieldAutoSize.NONE)
            {
               _loc1_.autoSize = TextFieldAutoSize.NONE;
            }
            _loc1_.width = this.var_304;
         }
         else if(_loc1_.autoSize != TextFieldAutoSize.LEFT)
         {
            _loc1_.autoSize = TextFieldAutoSize.LEFT;
         }
         this.refreshView();
      }
      
      private function setInputFieldFocus() : void
      {
         var _loc1_:ITextFieldWindow = this._window.findChildByName(INPUT) as ITextFieldWindow;
         if(_loc1_ == null)
         {
            return;
         }
         if(this.var_1439)
         {
            _loc1_.text = "";
            _loc1_.textColor = 0;
            this.var_1439 = false;
            this.var_502 = "";
         }
         _loc1_.focus();
      }
      
      private function setInputFieldUnFocus() : void
      {
         var _loc1_:ITextFieldWindow = this._window.findChildByName(INPUT) as ITextFieldWindow;
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.unfocus();
      }
      
      private function sendChatFromInputField(param1:int) : void
      {
         var _loc2_:ITextFieldWindow = this._window.findChildByName(INPUT) as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.text == "")
         {
            return;
         }
         var _loc3_:String = _loc2_.text;
         var _loc4_:Array = _loc3_.split(" ");
         var _loc5_:String = "";
         var _loc6_:* = "";
         switch(_loc4_[0])
         {
            case this.var_1168:
               param1 = 0;
               _loc5_ = _loc4_[1];
               _loc6_ = this.var_1168 + " " + _loc5_ + " ";
               _loc4_.shift();
               _loc4_.shift();
               break;
            case this._chatModeIdShout:
               param1 = 0;
               _loc4_.shift();
               break;
            case this.var_2410:
               param1 = 0;
               _loc4_.shift();
         }
         _loc3_ = _loc4_.join(" ");
         if(this._widget != null)
         {
            if(this.var_354.running)
            {
               this.var_354.reset();
            }
            if(this.var_420.running)
            {
               this.var_420.reset();
            }
            this._widget.sendChat(_loc3_,param1,_loc5_);
            this.var_620 = false;
            if(this.var_1442)
            {
               this.sendTypingMessage();
            }
            this.var_1442 = false;
         }
         _loc2_.text = _loc6_;
         this.var_502 = _loc6_;
         this.refreshView();
      }
      
      private function anotherFieldHasFocus() : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc1_:ITextFieldWindow = this._window.findChildByName(INPUT) as ITextFieldWindow;
         if(_loc1_ != null)
         {
            if(_loc1_.focused)
            {
               return false;
            }
         }
         var _loc2_:DisplayObject = this._window.context.getDesktopWindow().getDisplayObject();
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.stage;
            if(_loc3_ != null)
            {
               _loc4_ = _loc3_.focus;
               if(_loc4_ == null)
               {
                  return false;
               }
               if(_loc4_ is TextField)
               {
                  return true;
               }
            }
         }
         return false;
      }
   }
}
