package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.ToggleStaffPickMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var _window:IWindowContainer;
      
      private var var_179:IWindowContainer;
      
      private var var_2954:int;
      
      private var var_387:RoomEventViewCtrl;
      
      private var var_272:Timer;
      
      private var var_192:RoomSettingsCtrl;
      
      private var var_274:RoomThumbnailCtrl;
      
      private var var_1311:TagRenderer;
      
      private var var_319:IWindowContainer;
      
      private var var_451:IWindowContainer;
      
      private var var_838:IWindowContainer;
      
      private var var_2803:IWindowContainer;
      
      private var var_2804:IWindowContainer;
      
      private var var_1576:IWindowContainer;
      
      private var var_912:ITextWindow;
      
      private var var_1294:ITextWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_1035:ITextWindow;
      
      private var var_1577:ITextWindow;
      
      private var var_1293:ITextWindow;
      
      private var var_1033:ITextWindow;
      
      private var var_2019:ITextWindow;
      
      private var var_273:IWindowContainer;
      
      private var var_1031:IWindowContainer;
      
      private var var_2022:IWindowContainer;
      
      private var var_2508:ITextWindow;
      
      private var var_837:ITextWindow;
      
      private var var_2802:IWindow;
      
      private var var_1582:IContainerButtonWindow;
      
      private var var_1574:IContainerButtonWindow;
      
      private var var_1578:IContainerButtonWindow;
      
      private var var_1581:IContainerButtonWindow;
      
      private var var_1580:IContainerButtonWindow;
      
      private var var_1575:IContainerButtonWindow;
      
      private var var_2021:IButtonWindow;
      
      private var var_2020:IButtonWindow;
      
      private var var_2018:IButtonWindow;
      
      private var var_1032:IWindowContainer;
      
      private var var_1579:ITextWindow;
      
      private var var_1295:ITextFieldWindow;
      
      private var _buttons:IWindowContainer;
      
      private var var_1292:IButtonWindow;
      
      private var var_1034:IButtonWindow;
      
      private var var_2805:String;
      
      private var var_2801:String;
      
      private var var_386:Boolean = true;
      
      private const const_559:int = 75;
      
      private const const_614:int = 3;
      
      private const const_453:int = 45;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_387 = new RoomEventViewCtrl(this._navigator);
         this.var_192 = new RoomSettingsCtrl(this._navigator,this,true);
         this.var_274 = new RoomThumbnailCtrl(this._navigator);
         this.var_1311 = new TagRenderer(this._navigator);
         this._navigator.roomSettingsCtrls.push(this.var_192);
         this.var_272 = new Timer(6000,1);
         this.var_272.addEventListener(TimerEvent.TIMER,this.hideInfo);
      }
      
      public function dispose() : void
      {
         if(this._navigator.toolbar)
         {
            this._navigator.toolbar.events.removeEventListener(HabboToolbarSetIconEvent.const_102,this.onToolbarIconState);
         }
         if(this.var_272)
         {
            this.var_272.removeEventListener(TimerEvent.TIMER,this.hideInfo);
            this.var_272.reset();
            this.var_272 = null;
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         this.refresh();
      }
      
      public function startEventEdit() : void
      {
         this.var_272.reset();
         this.var_387.active = true;
         this.var_192.active = false;
         this.var_274.active = false;
         this.reload();
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_272.reset();
         this.var_192.load(param1);
         this.var_192.active = true;
         this.var_387.active = false;
         this.var_274.active = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function backToRoomSettings() : void
      {
         this.var_192.active = true;
         this.var_387.active = false;
         this.var_274.active = false;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_272.reset();
         this.var_192.active = false;
         this.var_387.active = false;
         this.var_274.active = true;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      public function close() : void
      {
         if(this.var_386)
         {
            this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_1174,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         }
         if(this._window == null)
         {
            return;
         }
         this._window.visible = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      public function reload() : void
      {
         if(this._window != null && this._window.visible)
         {
            this.refresh();
         }
      }
      
      public function open(param1:Boolean) : void
      {
         this.var_272.reset();
         this.var_387.active = false;
         this.var_192.active = false;
         this.var_274.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(this._navigator.data.enteredGuestRoom.flatId);
         }
         this.refresh();
         this._window.visible = true;
         if(this.var_386)
         {
            this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_58,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         }
         this._window.parent.activate();
         this._window.activate();
         if(!param1)
         {
            this.var_272.start();
         }
      }
      
      public function toggle() : void
      {
         this.var_272.reset();
         this.var_387.active = false;
         this.var_192.active = false;
         this.var_274.active = false;
         this.refresh();
         if(this.var_386)
         {
            if(!this._window.visible)
            {
               this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_58,HabboToolbarIconEnum.ROOMINFO,this._window,false));
               this._window.parent.activate();
            }
            else
            {
               this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_574,HabboToolbarIconEnum.ROOMINFO,this._window,false));
            }
         }
         else
         {
            this._window.visible = !this._window.visible;
            this._window.x = this._window.desktop.width - this._window.width - this.const_614;
            this._window.y = this.const_559;
            if(this._window.visible)
            {
               this._window.activate();
            }
         }
      }
      
      private function refresh() : void
      {
         var _loc1_:int = 0;
         this.prepareWindow();
         this.refreshRoom();
         this.refreshEvent();
         this.refreshEmbed();
         this.refreshButtons();
         if(this.var_386)
         {
            Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info","buttons_container"],0,2);
            this._window.height = Util.getLowestPoint(this._window);
            this._window.y = this._window.desktop.height - this._window.height - 5;
            Logger.log("MAIN: " + this.var_319.rectangle + ", " + this.var_273.rectangle + ", " + this._window.rectangle);
         }
         else
         {
            Util.moveChildrenToColumn(this.var_179,["room_info","event_info","embed_info","buttons_container"],0,2);
            this.var_179.height = Util.getLowestPoint(this.var_179);
            _loc1_ = this._window.desktop.height - this._window.height - this.const_453;
            if(this._window.y > _loc1_)
            {
               this._window.y = _loc1_ < 0 ? 0 : int(_loc1_);
            }
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(this.var_319);
         if(this.var_386)
         {
            this.var_319.findChildByName("close").visible = true;
         }
         var _loc1_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _loc1_ != null && _loc1_.flatId == this._navigator.data.homeRoomId;
         this.refreshRoomDetails(_loc1_,_loc2_);
         this.refreshPublicSpaceDetails(this._navigator.data.enteredPublicSpace);
         this.refreshRoomButtons(_loc2_);
         this.var_192.refresh(this.var_319);
         this.var_274.refresh(this.var_319);
         Util.moveChildrenToColumn(this.var_319,["room_details","room_buttons"],0,2);
         this.var_319.height = Util.getLowestPoint(this.var_319);
         this.var_319.visible = true;
         Logger.log("XORP: " + this.var_451.visible + ", " + this.var_1576.visible + ", " + this.var_838.visible + ", " + this.var_838.rectangle + ", " + this.var_319.rectangle);
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(this.var_273);
         var _loc1_:RoomEventData = this._navigator.data.roomEventData;
         this.refreshEventDetails(_loc1_);
         this.refreshEventButtons(_loc1_);
         this.var_387.refresh(this.var_273);
         if(Util.hasVisibleChildren(this.var_273) && !(this.var_192.active || this.var_274.active))
         {
            Util.moveChildrenToColumn(this.var_273,["event_details","event_buttons"],0,2);
            this.var_273.height = Util.getLowestPoint(this.var_273);
            this.var_273.visible = true;
         }
         else
         {
            this.var_273.visible = false;
         }
         Logger.log("EVENT: " + this.var_273.visible + ", " + this.var_273.rectangle);
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = this._navigator.configuration.getKey("embed.showInRoomInfo","RoomWidgetDimmerUpdateEvent") == "true";
         var _loc2_:* = this._navigator.data.enteredGuestRoom != null;
         if(_loc2_ && _loc1_ && !this.var_192.active && !this.var_274.active && !this.var_387.active)
         {
            this.var_1032.visible = true;
            this.var_1295.text = this.getEmbedData();
         }
         else
         {
            this.var_1032.visible = false;
         }
      }
      
      private function refreshButtons() : void
      {
         var _loc1_:* = false;
         if(!this._buttons)
         {
            return;
         }
         if(this.var_192.active)
         {
            this._buttons.visible = false;
            return;
         }
         this._buttons.visible = true;
         if(this.var_1292)
         {
            if(this.var_2805 == "exit_homeroom")
            {
               this.var_1292.caption = "${navigator.homeroom}";
            }
            else
            {
               this.var_1292.caption = "${navigator.hotelview}";
            }
         }
         if(this.var_1034)
         {
            _loc1_ = this._navigator.data.enteredGuestRoom != null;
            this.var_1034.visible = _loc1_;
            if(this.var_2801 == "0")
            {
               this.var_1034.caption = "${navigator.zoom.in}";
            }
            else
            {
               this.var_1034.caption = "${navigator.zoom.out}";
            }
         }
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || this.var_192.active || this.var_274.active)
         {
            return;
         }
         this.var_912.text = param1.roomName;
         this.var_912.height = this.var_912.textHeight + 5;
         this._ownerName.text = param1.ownerName;
         this.var_1035.text = param1.description;
         this.var_1311.refreshTags(this.var_451,param1.tags);
         this.var_1035.visible = false;
         if(param1.description != "")
         {
            this.var_1035.height = this.var_1035.textHeight + 5;
            this.var_1035.visible = true;
         }
         var _loc3_:Boolean = Boolean(this._navigator.configuration.getKey("client.allow.facebook.like") == "1");
         this._navigator.refreshButton(this.var_1574,"facebook_logo_small",_loc3_,null,0);
         this.var_1574.visible = _loc3_;
         var _loc4_:* = this._navigator.data.currentRoomRating == -1;
         this._navigator.refreshButton(this.var_1582,"thumb_up",_loc4_,null,0);
         this.var_1582.visible = _loc4_;
         this.var_1033.visible = !_loc4_;
         this.var_2019.visible = !_loc4_;
         this.var_2019.text = "" + this._navigator.data.currentRoomRating;
         this.refreshStuffPick();
         this._navigator.refreshButton(this.var_451,"home",param2,null,0);
         this._navigator.refreshButton(this.var_451,"favourite",!param2 && this._navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(this.var_451,["room_name","owner_name_cont","tags","room_desc","rating_cont","staff_pick_button"],this.var_912.y,0);
         this.var_451.visible = true;
         this.var_451.height = Util.getLowestPoint(this.var_451);
      }
      
      private function refreshStuffPick() : void
      {
         var _loc1_:IWindow = this.var_451.findChildByName("staff_pick_button");
         if(!this._navigator.data.roomPicker)
         {
            _loc1_.visible = false;
            return;
         }
         _loc1_.visible = true;
         _loc1_.caption = this._navigator.getText(!!this._navigator.data.currentRoomIsStaffPick ? "navigator.staffpicks.unpick" : "navigator.staffpicks.pick");
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || this.var_192.active || this.var_274.active)
         {
            return;
         }
         this.var_1294.text = this._navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         this.var_1294.height = this.var_1294.textHeight + 5;
         this.var_1577.text = this._navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         this.var_1577.height = this.var_1577.textHeight + 5;
         Util.moveChildrenToColumn(this.var_838,["public_space_name","public_space_desc"],this.var_1294.y,0);
         this.var_838.visible = true;
         this.var_838.height = Math.max(86,Util.getLowestPoint(this.var_838));
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || this.var_387.active)
         {
            return;
         }
         this.var_2508.text = param1.eventName;
         this.var_837.text = param1.eventDescription;
         this.var_1311.refreshTags(this.var_1031,[this._navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         this.var_837.visible = false;
         if(param1.eventDescription != "")
         {
            this.var_837.height = this.var_837.textHeight + 5;
            this.var_837.y = Util.getLowestPoint(this.var_1031) + 2;
            this.var_837.visible = true;
         }
         this.var_1031.visible = true;
         this.var_1031.height = Util.getLowestPoint(this.var_1031);
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(this._navigator.data.enteredGuestRoom == null || this.var_192.active || this.var_274.active)
         {
            return;
         }
         this.var_2021.visible = this._navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = this._navigator.data.isCurrentRoomFavourite();
         this.var_1578.visible = this._navigator.data.canAddFavourite && !_loc2_;
         this.var_1581.visible = this._navigator.data.canAddFavourite && _loc2_;
         this.var_1580.visible = this._navigator.data.canEditRoomSettings && !param1;
         this.var_1575.visible = this._navigator.data.canEditRoomSettings && param1;
         this.var_1576.visible = Util.hasVisibleChildren(this.var_1576);
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(this.var_387.active)
         {
            return;
         }
         this.var_2020.visible = param1 == null && this._navigator.data.currentRoomOwner;
         this.var_2018.visible = param1 != null && (this._navigator.data.currentRoomOwner || this._navigator.data.eventMod);
         this.var_2022.visible = Util.hasVisibleChildren(this.var_2022);
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         if(this.var_386)
         {
            this._window = IWindowContainer(this._navigator.getXmlWindow("iro_room_details"));
            this._window.setParamFlag(HabboWindowParam.const_63,false);
            this._window.setParamFlag(HabboWindowParam.const_1646,true);
         }
         else
         {
            this._window = IWindowContainer(this._navigator.getXmlWindow("iro_room_details_framed"));
            this.var_179 = this._window.findChildByName("content") as IWindowContainer;
         }
         this._window.visible = false;
         this.var_319 = IWindowContainer(this.find("room_info"));
         this.var_451 = IWindowContainer(this.find("room_details"));
         this.var_838 = IWindowContainer(this.find("public_space_details"));
         this.var_2803 = IWindowContainer(this.find("owner_name_cont"));
         this.var_2804 = IWindowContainer(this.find("rating_cont"));
         this.var_1576 = IWindowContainer(this.find("room_buttons"));
         this.var_912 = ITextWindow(this.find("room_name"));
         this.var_1294 = ITextWindow(this.find("public_space_name"));
         this._ownerName = ITextWindow(this.find("owner_name"));
         this.var_1035 = ITextWindow(this.find("room_desc"));
         this.var_1577 = ITextWindow(this.find("public_space_desc"));
         this.var_1293 = ITextWindow(this.find("owner_caption"));
         this.var_1033 = ITextWindow(this.find("rating_caption"));
         this.var_2019 = ITextWindow(this.find("rating_txt"));
         this.var_273 = IWindowContainer(this.find("event_info"));
         this.var_1031 = IWindowContainer(this.find("event_details"));
         this.var_2022 = IWindowContainer(this.find("event_buttons"));
         this.var_2508 = ITextWindow(this.find("event_name"));
         this.var_837 = ITextWindow(this.find("event_desc"));
         this.var_1574 = IContainerButtonWindow(this.find("facebook_like_button"));
         this.var_1582 = IContainerButtonWindow(this.find("rate_up_button"));
         this.var_2802 = this.find("staff_pick_button");
         this.var_1578 = IContainerButtonWindow(this.find("add_favourite_button"));
         this.var_1581 = IContainerButtonWindow(this.find("rem_favourite_button"));
         this.var_1580 = IContainerButtonWindow(this.find("make_home_button"));
         this.var_1575 = IContainerButtonWindow(this.find("unmake_home_button"));
         this.var_2021 = IButtonWindow(this.find("room_settings_button"));
         this.var_2020 = IButtonWindow(this.find("create_event_button"));
         this.var_2018 = IButtonWindow(this.find("edit_event_button"));
         this.var_1032 = IWindowContainer(this.find("embed_info"));
         this.var_1579 = ITextWindow(this.find("embed_info_txt"));
         this.var_1295 = ITextFieldWindow(this.find("embed_src_txt"));
         this._buttons = IWindowContainer(this.find("buttons_container"));
         this.var_1292 = IButtonWindow(this.find("exit_room_button"));
         this.var_1034 = IButtonWindow(this.find("zoom_button"));
         Util.setProcDirectly(this.var_1578,this.onAddFavouriteClick);
         Util.setProcDirectly(this.var_1581,this.onRemoveFavouriteClick);
         Util.setProcDirectly(this.var_2021,this.onRoomSettingsClick);
         Util.setProcDirectly(this.var_1580,this.onMakeHomeClick);
         Util.setProcDirectly(this.var_1575,this.onUnmakeHomeClick);
         Util.setProcDirectly(this.var_2020,this.onEventSettingsClick);
         Util.setProcDirectly(this.var_2018,this.onEventSettingsClick);
         Util.setProcDirectly(this.var_1295,this.onEmbedSrcClick);
         Util.setProcDirectly(this.var_1582,this.onThumbUp);
         Util.setProcDirectly(this.var_2802,this.onStaffPick);
         Util.setProcDirectly(this.var_1574,this.onFacebookLike);
         Util.setProcDirectly(this.var_1034,this.onZoomClick);
         Util.setProcDirectly(this.var_1292,this.onExitRoomClick);
         this._navigator.refreshButton(this.var_1578,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1581,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1580,"home",true,null,0);
         this._navigator.refreshButton(this.var_1575,"home",true,null,0);
         if(this.var_386)
         {
            this._window.findChildByName("close").procedure = this.onCloseButtonClick;
         }
         else
         {
            this._window.findChildByTag("close").procedure = this.onCloseButtonClick;
         }
         Util.setProcDirectly(this.var_319,this.onHover);
         Util.setProcDirectly(this.var_273,this.onHover);
         this.var_1293.width = this.var_1293.textWidth;
         Util.moveChildrenToRow(this.var_2803,["owner_caption","owner_name"],this.var_1293.x,this.var_1293.y,3);
         this.var_1033.width = this.var_1033.textWidth;
         Util.moveChildrenToRow(this.var_2804,["rating_caption","rating_txt"],this.var_1033.x,this.var_1033.y,3);
         this.var_1579.height = this.var_1579.textHeight + 5;
         Util.moveChildrenToColumn(this.var_1032,["embed_info_txt","embed_src_txt"],this.var_1579.y,2);
         this.var_1032.height = Util.getLowestPoint(this.var_1032) + 5;
         this.var_2954 = this._window.y + this._window.height;
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = this._window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!this._navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(this._navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(this._navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            this._navigator.send(new AddFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         this._navigator.send(new DeleteFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.roomEventData == null)
         {
            if(this._navigator.data.currentRoomOwner)
            {
               this._navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            this.startEventEdit();
         }
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         this.startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.hideInfo(null);
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function onStaffPick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new ToggleStaffPickMessageComposer(this._navigator.data.enteredGuestRoom.flatId,this._navigator.data.currentRoomIsStaffPick));
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function onFacebookLike(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         HabboWebTools.facebookLike(this._navigator.data.enteredGuestRoom.flatId);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.var_1295.setSelection(0,this.var_1295.text.length);
      }
      
      private function onZoomClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.const_36);
         _loc3_.iconId = HabboToolbarIconEnum.ZOOM;
         _loc3_.iconName = "ZOOM";
         this._navigator.toolbar.events.dispatchEvent(_loc3_);
      }
      
      private function onExitRoomClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.const_36);
         _loc3_.iconId = HabboToolbarIconEnum.EXITROOM;
         _loc3_.iconName = "EXITROOM";
         this._navigator.toolbar.events.dispatchEvent(_loc3_);
      }
      
      private function onToolbarIconState(param1:HabboToolbarSetIconEvent) : void
      {
         if(param1.type != HabboToolbarSetIconEvent.const_102)
         {
            return;
         }
         switch(param1.iconId)
         {
            case HabboToolbarIconEnum.ZOOM:
               this.var_2801 = param1.iconState;
               this.refreshButtons();
               break;
            case HabboToolbarIconEnum.EXITROOM:
               this.var_2805 = param1.iconState;
               this.refreshButtons();
         }
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         this.var_272.reset();
      }
      
      private function hideInfo(param1:Event) : void
      {
         if(this.var_386)
         {
            this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_574,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         }
         else
         {
            this._window.visible = false;
         }
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this._navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + this._navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + this._navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = this._navigator.configuration.getKey("user.hash","");
         this._navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         this._navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         this._navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return this._navigator.getText("navigator.embed.src");
      }
      
      public function registerToolbarEvents() : void
      {
         if(this._navigator.toolbar)
         {
            this._navigator.toolbar.events.addEventListener(HabboToolbarSetIconEvent.const_102,this.onToolbarIconState);
         }
      }
      
      public function handleToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(!this.var_386 || param1.type != HabboToolbarEvent.const_36)
         {
            return;
         }
         switch(param1.iconId)
         {
            case HabboToolbarIconEnum.MEMENU:
               this.close();
               break;
            case HabboToolbarIconEnum.ROOMINFO:
               this.toggle();
         }
      }
      
      public function configure() : void
      {
         if(this._navigator.configuration)
         {
            this.var_386 = this._navigator.configuration.getKey("roominfo.widget.enabled") != "1";
         }
      }
      
      public function get useToolbar() : Boolean
      {
         return this.var_386;
      }
   }
}
