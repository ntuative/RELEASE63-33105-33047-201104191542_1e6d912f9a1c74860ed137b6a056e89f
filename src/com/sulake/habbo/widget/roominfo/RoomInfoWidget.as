package com.sulake.habbo.widget.roominfo
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.navigator.IHabboNavigator;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.RoomWidgetFactory;
   import flash.display.BitmapData;
   import flash.events.IEventDispatcher;
   
   public class RoomInfoWidget extends RoomWidgetBase
   {
       
      
      private var _view:IWindowContainer;
      
      private var _navigator:IHabboNavigator;
      
      private const const_559:int = 44;
      
      private const const_614:int = 100;
      
      public function RoomInfoWidget(param1:RoomWidgetFactory)
      {
         var _loc3_:* = null;
         super(param1.windowManager,param1.assets,param1.localizations);
         this._navigator = param1.navigator;
         var _loc2_:XML = XmlAsset(assets.getAssetByName("room_info_widget")).content as XML;
         this._view = windowManager.buildFromXML(_loc2_,1) as IWindowContainer;
         _loc3_ = this._view.findChildByName("text");
         _loc3_.caption = "${" + _loc3_.caption + "}";
         var _loc4_:IBitmapWrapperWindow = this._view.findChildByName("icon") as IBitmapWrapperWindow;
         _loc4_.bitmap = BitmapDataAsset(assets.getAssetByName("roominfo_icon")).content as BitmapData;
         _loc4_.disposesBitmap = false;
         var _loc5_:IWindowContainer = this._view.desktop;
         this._view.x = _loc5_.width - this._view.width - this.const_614;
         this._view.y = this.const_559;
         this._view.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onRoomInfoClick);
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         if(this._view)
         {
            this._view.dispose();
            this._view = null;
         }
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(!param1)
         {
            return;
         }
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
      }
      
      private function onRoomInfoClick(param1:WindowMouseEvent) : void
      {
         this._navigator.toggleRoomInfo();
      }
   }
}
