package com.sulake.habbo.toolbar
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   import flash.external.ExternalInterface;
   
   public class LogoutController
   {
       
      
      private var _windowManager:IHabboWindowManager;
      
      private var _assets:IAssetLibrary;
      
      private var _events:IEventDispatcher;
      
      private var _button:IWindowContainer;
      
      private var var_683:IWindowContainer;
      
      private const const_559:int = 44;
      
      private const const_614:int = 3;
      
      public function LogoutController(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IEventDispatcher)
      {
         var _loc4_:* = null;
         super();
         this._windowManager = param1;
         this._assets = param2;
         this._events = param3;
         this._button = this.createWindow("logout_xml") as IWindowContainer;
         _loc4_ = this._button.findChildByName("help_text");
         _loc4_.caption = "${" + _loc4_.caption + "}";
         _loc4_ = this._button.findChildByName("logout_text");
         _loc4_.caption = "${" + _loc4_.caption + "}";
      }
      
      public function dispose() : void
      {
         this._windowManager = null;
         this._assets = null;
         this._events = null;
         if(this._button)
         {
            this._button.dispose();
            this._button = null;
         }
         if(this.var_683)
         {
            this.var_683.dispose();
            this.var_683 = null;
         }
      }
      
      private function createWindow(param1:String) : IWindow
      {
         var _loc2_:XmlAsset = this._assets.getAssetByName(param1) as XmlAsset;
         var _loc3_:IWindow = this._windowManager.buildFromXML(_loc2_.content as XML);
         _loc3_.procedure = this.onClick;
         var _loc4_:IWindowContainer = _loc3_.desktop;
         _loc3_.x = _loc4_.width - _loc3_.width - this.const_614;
         _loc3_.y = this.const_559;
         return _loc3_;
      }
      
      private function showConfirmation() : void
      {
         if(!this.var_683)
         {
            this.var_683 = this.createWindow("logout_confirmation_xml") as IWindowContainer;
         }
      }
      
      private function closeConfirmation() : void
      {
         if(this.var_683)
         {
            this.var_683.dispose();
            this.var_683 = null;
         }
      }
      
      private function onClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         switch(param2.name)
         {
            case "logout_region":
               this.showConfirmation();
               break;
            case "help_region":
               _loc3_ = new HabboToolbarEvent(HabboToolbarEvent.const_36);
               _loc3_.iconId = HabboToolbarIconEnum.HELP;
               this._events.dispatchEvent(_loc3_);
               break;
            case "confirm":
               if(false)
               {
                  ExternalInterface.call("FlashExternalInterface.logout");
               }
               this.closeConfirmation();
               break;
            case "cancel":
               this.closeConfirmation();
         }
      }
   }
}
