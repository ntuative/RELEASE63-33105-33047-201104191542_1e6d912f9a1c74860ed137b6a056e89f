package com.sulake.habbo.widget.avatarinfo
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetUserActionMessage;
   import flash.geom.Point;
   
   public class AvatarMenuView extends AvatarInfoView
   {
      
      protected static const const_963:uint = 0;
      
      protected static const const_632:uint = 1;
      
      protected static const const_1297:uint = 2;
       
      
      protected var _data:AvatarInfoData;
      
      protected var var_561:uint = 0;
      
      public function AvatarMenuView(param1:AvatarInfoWidget, param2:int, param3:String, param4:int, param5:int, param6:AvatarInfoData)
      {
         super(param1,param2,param3,param4,param5,false);
         this._data = param6;
         var_1337 = XmlAsset(_widget.assets.getAssetByName("avatar_menu_widget")).content as XML;
      }
      
      override public function dispose() : void
      {
         if(_window)
         {
            _window.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.onMouseHoverEvent);
            _window.removeEventListener(WindowMouseEvent.const_25,this.onMouseHoverEvent);
         }
         super.dispose();
      }
      
      override protected function createWindow() : void
      {
         if(!_widget || true || true)
         {
            return;
         }
         _window = _widget.windowManager.buildFromXML(var_1337,0) as IWindowContainer;
         if(!_window)
         {
            return;
         }
         _window.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.onMouseHoverEvent);
         _window.addEventListener(WindowMouseEvent.const_25,this.onMouseHoverEvent);
         setImageAsset(_window.findChildByName("pointer") as IBitmapWrapperWindow,"arrow_down_gray");
         _window.findChildByName("name").caption = _userName;
         _window.findChildByName("link_moderate").procedure = this.buttonEventProc;
         _window.findChildByName("link_show_actions").procedure = this.buttonEventProc;
         _window.findChildByName("link_more_actions").procedure = this.buttonEventProc;
         this.updateButtons();
         _window.visible = false;
      }
      
      protected function updateButtons() : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:Boolean = false;
         var _loc1_:IItemListWindow = _window.findChildByName("buttons") as IItemListWindow;
         _loc1_.procedure = this.buttonEventProc;
         _loc1_.autoArrangeItems = false;
         var _loc2_:int = _loc1_.numListItems;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_.getListItemAt(_loc3_).visible = false;
            _loc3_++;
         }
         if(this.var_561 == const_963)
         {
            _window.findChildByName("link_moderate").visible = false;
            _window.findChildByName("link_show_actions").visible = false;
            _window.findChildByName("link_more_actions").visible = true;
         }
         if(this.var_561 == const_963 || this.var_561 == const_632)
         {
            _loc1_.getListItemByName("friend").visible = true;
            if(this._data.canBeAskedAsFriend)
            {
               _loc1_.getListItemByName("friend").enable();
            }
            else
            {
               _loc1_.getListItemByName("friend").disable();
               this.var_561 = const_632;
            }
         }
         if(this.var_561 == const_632)
         {
            _window.findChildByName("link_moderate").visible = true;
            _window.findChildByName("link_show_actions").visible = false;
            _window.findChildByName("link_more_actions").visible = false;
            _loc4_ = this._data.respectLeft;
            _widget.localizations.registerParameter("infostand.button.respect","count",_loc4_.toString());
            _loc1_.getListItemByName("respect").visible = true;
            if(_loc4_ > 0)
            {
               _loc1_.getListItemByName("respect").enable();
            }
            else
            {
               _loc1_.getListItemByName("respect").disable();
            }
            _loc1_.getListItemByName("trade").visible = true;
            if(this._data.canTrade)
            {
               _loc1_.getListItemByName("trade").enable();
            }
            else
            {
               _loc1_.getListItemByName("trade").disable();
            }
            switch(this._data.canTradeReason)
            {
               case RoomWidgetUserInfoUpdateEvent.const_724:
                  _loc5_ = "${infostand.button.trade.tooltip.shutdown}";
                  break;
               case RoomWidgetUserInfoUpdateEvent.const_938:
                  _loc5_ = "${infostand.button.trade.tooltip.tradingroom}";
                  break;
               default:
                  _loc5_ = "";
            }
            IInteractiveWindow(_loc1_.getListItemByName("trade")).toolTipCaption = _loc5_;
            _loc1_.getListItemByName("whisper").visible = true;
            if(this._data.amIOwner)
            {
               _loc1_.getListItemByName("give_rights").visible = !this._data.hasFlatControl;
               _loc1_.getListItemByName("remove_rights").visible = this._data.hasFlatControl;
            }
            else
            {
               _loc1_.getListItemByName("give_rights").visible = false;
               _loc1_.getListItemByName("remove_rights").visible = false;
            }
         }
         if(this.var_561 == const_1297)
         {
            _window.findChildByName("link_moderate").visible = false;
            _window.findChildByName("link_show_actions").visible = true;
            _window.findChildByName("link_more_actions").visible = false;
            _loc1_.getListItemByName("ignore").visible = !this._data.isIgnored;
            _loc1_.getListItemByName("unignore").visible = this._data.isIgnored;
            _loc1_.getListItemByName("kick").visible = (this._data.amIOwner || this._data.amIController || this._data.amIAnyRoomController) && this._data.canBeKicked;
            _loc1_.getListItemByName("ban").visible = (this._data.amIOwner || this._data.amIAnyRoomController) && this._data.canBeKicked;
            _loc6_ = false;
            if(false && _widget.configuration.getKey("infostand.report.show","0") == "1")
            {
               _loc6_ = true;
            }
            _loc1_.getListItemByName("report").visible = _loc6_;
         }
         _loc1_.autoArrangeItems = true;
         _loc1_.visible = true;
      }
      
      private function buttonEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "whisper":
                  _loc3_ = "null";
                  break;
               case "friend":
                  param2.disable();
                  this._data.canBeAskedAsFriend = false;
                  _loc3_ = "null";
                  break;
               case "respect":
                  --this._data.respectLeft;
                  _loc4_ = this._data.respectLeft;
                  _widget.localizations.registerParameter("infostand.button.respect","count",_loc4_.toString());
                  if(this._data.respectLeft > 0)
                  {
                     param2.enable();
                  }
                  else
                  {
                     param2.disable();
                  }
                  _loc3_ = "null";
                  break;
               case "ignore":
                  param2.visible = false;
                  _window.findChildByName("unignore").visible = true;
                  this._data.isIgnored = true;
                  _loc3_ = "null";
                  break;
               case "unignore":
                  param2.visible = false;
                  _window.findChildByName("ignore").visible = true;
                  this._data.isIgnored = false;
                  _loc3_ = "null";
                  break;
               case "kick":
                  _loc3_ = "null";
                  break;
               case "ban":
                  _loc3_ = "null";
                  break;
               case "give_rights":
                  param2.visible = false;
                  _window.findChildByName("remove_rights").visible = true;
                  _loc3_ = "null";
                  break;
               case "remove_rights":
                  param2.visible = false;
                  _window.findChildByName("give_rights").visible = true;
                  _loc3_ = "null";
                  break;
               case "trade":
                  _loc3_ = "null";
                  break;
               case "report":
                  _loc3_ = "null";
                  break;
               case "link_moderate":
                  this.var_561 = const_1297;
                  this.updateButtons();
                  break;
               case "link_show_actions":
                  this.var_561 = const_963;
                  this.updateButtons();
                  break;
               case "link_more_actions":
                  this.var_561 = const_632;
                  this.updateButtons();
            }
            if(_loc3_ != null)
            {
               _loc5_ = new RoomWidgetUserActionMessage(_loc3_,_userId);
               _widget.messageListener.processWidgetMessage(_loc5_);
            }
            this.updateButtons();
         }
      }
      
      protected function onMouseHoverEvent(param1:WindowMouseEvent) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            var_1338 = true;
         }
         else if(param1.type == WindowMouseEvent.const_25)
         {
            if(!_window.hitTestGlobalPoint(new Point(param1.stageX,param1.stageY)))
            {
               var_1338 = false;
            }
         }
      }
   }
}
