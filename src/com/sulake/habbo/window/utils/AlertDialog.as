package com.sulake.habbo.window.utils
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.utils.INotify;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboAlertDialogFlag;
   
   public class AlertDialog implements IAlertDialog, INotify
   {
      
      protected static const const_1808:String = "_alert_button_list";
      
      protected static const const_530:String = "_alert_button_ok";
      
      protected static const const_964:String = "_alert_button_cancel";
      
      protected static const const_1142:String = "_alert_button_custom";
      
      protected static const const_1301:String = "header_button_close";
      
      protected static const const_1719:String = "_alert_text_summary";
      
      private static var var_572:uint = 0;
       
      
      protected var _title:String = "";
      
      protected var var_1757:String = "";
      
      protected var _disposed:Boolean = false;
      
      protected var var_285:Function = null;
      
      protected var _window:IFrameWindow;
      
      public function AlertDialog(param1:IHabboWindowManager, param2:XML, param3:String, param4:String, param5:uint, param6:Function)
      {
         var _loc8_:* = null;
         super();
         ++var_572;
         this._window = param1.buildFromXML(param2,2) as IFrameWindow;
         if(param5 == HabboAlertDialogFlag.const_45)
         {
            param5 = 0 | 0 | 0;
         }
         var _loc7_:IItemListWindow = this._window.findChildByName(const_1808) as IItemListWindow;
         if(_loc7_)
         {
            if(!(param5 & 0))
            {
               _loc8_ = _loc7_.getListItemByName(const_530);
               _loc8_.dispose();
            }
            if(!(param5 & 0))
            {
               _loc8_ = _loc7_.getListItemByName(const_964);
               _loc8_.dispose();
            }
            if(!(param5 & 0))
            {
               _loc8_ = _loc7_.getListItemByName(const_1142);
               _loc8_.dispose();
            }
         }
         this._window.procedure = this.dialogEventProc;
         this._window.center();
         this.title = param3;
         this.summary = param4;
         this.callback = param6;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            if(this._window && !this._window.disposed)
            {
               this._window.dispose();
               this._window = null;
            }
            this.var_285 = null;
            this._disposed = true;
         }
      }
      
      protected function dialogEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case const_530:
                  if(this.var_285 != null)
                  {
                     _loc3_ = WindowEvent.allocate(WindowEvent.const_179,null,null);
                     this.var_285(this,_loc3_);
                     _loc3_.recycle();
                  }
                  else
                  {
                     this.dispose();
                  }
                  break;
               case const_1301:
                  if(this.var_285 != null)
                  {
                     _loc3_ = WindowEvent.allocate(WindowEvent.const_459,null,null);
                     this.var_285(this,_loc3_);
                     _loc3_.recycle();
                  }
                  else
                  {
                     this.dispose();
                  }
            }
         }
      }
      
      public function getButtonCaption(param1:int) : ICaption
      {
         var _loc2_:* = null;
         if(!this._disposed)
         {
            switch(param1)
            {
               case HabboAlertDialogFlag.const_530:
                  _loc2_ = this._window.findChildByName(const_530) as IInteractiveWindow;
                  break;
               case HabboAlertDialogFlag.const_964:
                  _loc2_ = this._window.findChildByName(const_964) as IInteractiveWindow;
                  break;
               case HabboAlertDialogFlag.const_1142:
                  _loc2_ = this._window.findChildByName(const_1142) as IInteractiveWindow;
            }
         }
         return !!_loc2_ ? new AlertDialogCaption(_loc2_.caption,_loc2_.toolTipCaption,_loc2_.visible) : null;
      }
      
      public function setButtonCaption(param1:int, param2:ICaption) : void
      {
      }
      
      public function set title(param1:String) : void
      {
         this._title = param1;
         if(this._window)
         {
            this._window.caption = this._title;
         }
      }
      
      public function get title() : String
      {
         return this._title;
      }
      
      public function set summary(param1:String) : void
      {
         this.var_1757 = param1;
         if(this._window)
         {
            ITextWindow(this._window.findChildByTag("DESCRIPTION")).text = this.var_1757;
         }
      }
      
      public function get summary() : String
      {
         return this.var_1757;
      }
      
      public function set callback(param1:Function) : void
      {
         this.var_285 = param1;
      }
      
      public function get callback() : Function
      {
         return this.var_285;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
   }
}
