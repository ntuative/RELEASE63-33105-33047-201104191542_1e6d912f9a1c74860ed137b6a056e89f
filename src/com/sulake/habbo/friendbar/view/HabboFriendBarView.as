package com.sulake.habbo.friendbar.view
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.friendbar.HabboFriendBar;
   import com.sulake.habbo.friendbar.data.IFriendEntity;
   import com.sulake.habbo.friendbar.data.IHabboFriendBarData;
   import com.sulake.habbo.friendbar.events.FindFriendsNotificationEvent;
   import com.sulake.habbo.friendbar.events.FriendBarUpdateEvent;
   import com.sulake.habbo.friendbar.events.FriendRequestEvent;
   import com.sulake.habbo.friendbar.events.NewMessageEvent;
   import com.sulake.habbo.friendbar.iid.IIDHabboFriendBarData;
   import com.sulake.habbo.friendbar.view.tabs.AddFriendsEntityTab;
   import com.sulake.habbo.friendbar.view.tabs.FriendEntityTab;
   import com.sulake.habbo.friendbar.view.tabs.ITab;
   import com.sulake.habbo.friendbar.view.tabs.Tab;
   import com.sulake.habbo.friendbar.view.utils.FriendListIcon;
   import com.sulake.habbo.friendbar.view.utils.Icon;
   import com.sulake.habbo.friendbar.view.utils.MessengerIcon;
   import com.sulake.habbo.friendbar.view.utils.TextCropper;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboAlertDialogFlag;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import com.sulake.iid.IIDAvatarRenderManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import iid.IIDHabboWindowManager;
   
   public class HabboFriendBarView extends Component implements IHabboFriendBarView, IAvatarImageListener
   {
      
      private static const const_1361:int = 127;
      
      private static const const_445:int = 1;
      
      private static const const_1365:int = 2;
      
      private static var var_749:int = 3;
      
      private static const const_1002:int = 3;
      
      private static const const_1368:Boolean = false;
      
      private static const const_999:int = 1;
      
      private static const const_1363:String = "bar_xml";
      
      private static const const_1364:String = "toggle_xml";
      
      private static const const_68:String = "container";
      
      private static const const_1362:String = "border";
      
      private static const const_444:String = "list";
      
      private static const const_687:String = "header";
      
      private static const const_637:String = "canvas";
      
      private static const const_998:String = "icon";
      
      private static const const_1003:String = "button_left";
      
      private static const const_996:String = "button_right";
      
      private static const const_1000:String = "button_left_page";
      
      private static const const_995:String = "button_right_page";
      
      private static const const_997:String = "button_left_end";
      
      private static const const_994:String = "button_right_end";
      
      private static const const_1301:String = "button_close";
      
      private static const const_1367:String = "button_open";
      
      private static const const_1366:String = "messenger";
      
      private static const const_1001:String = "friendlist";
       
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_1108:IAvatarRenderManager;
      
      private var var_106:IHabboFriendBarData;
      
      private var var_37:IWindowContainer;
      
      private var var_201:IWindowContainer;
      
      private var var_107:Vector.<ITab>;
      
      private var var_1411:ITab;
      
      private var var_1131:int = -1;
      
      private var _startIndex:int = 0;
      
      private var var_1412:TextCropper;
      
      private var var_750:FriendListIcon;
      
      private var var_496:MessengerIcon;
      
      private var var_1132:Boolean = false;
      
      private var var_2357:Boolean = false;
      
      public function HabboFriendBarView(param1:HabboFriendBar, param2:uint, param3:IAssetLibrary)
      {
         super(param1,param2,param3);
         this.var_1412 = new TextCropper();
         this.var_107 = new Vector.<ITab>();
         if(param1 is HabboFriendBar)
         {
            this.var_1132 = HabboFriendBar(param1).findFriendsEnabled;
         }
         if(param2 == 0)
         {
            this.var_2357 = true;
            var_749 = 83;
         }
         queueInterface(new IIDAvatarRenderManager(),this.onAvatarRendererAvailable);
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerAvailable);
         queueInterface(new IIDHabboFriendBarData(),this.onFriendBarDataAvailable);
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            this._windowManager.getWindowContext(const_445).getDesktopWindow().removeEventListener(WindowEvent.const_41,this.onDesktopResized);
            if(this.var_496)
            {
               this.var_496.dispose();
               this.var_496 = null;
            }
            if(this.var_750)
            {
               this.var_750.dispose();
               this.var_750 = null;
            }
            if(this.var_201)
            {
               this.var_201.dispose();
               this.var_201 = null;
            }
            if(this.var_37)
            {
               this.var_37.dispose();
               this.var_37 = null;
            }
            while(this.var_107.length > 0)
            {
               ITab(this.var_107.pop()).dispose();
            }
            if(this.var_106)
            {
               this.var_106.events.removeEventListener(FriendBarUpdateEvent.const_694,this.onRefreshView);
               this.var_106 = null;
               release(new IIDHabboFriendBarData());
            }
            if(this._windowManager)
            {
               this._windowManager = null;
               release(new IIDHabboWindowManager());
            }
            if(this.var_1108)
            {
               this.var_1108 = null;
               release(new IIDAvatarRenderManager());
            }
            this.var_1412.dispose();
            this.var_1412 = null;
            super.dispose();
         }
      }
      
      public function set visible(param1:Boolean) : void
      {
         if(this.var_37)
         {
            this.var_37.visible = param1;
            this.var_37.activate();
         }
         if(this.var_201)
         {
            this.var_201.visible = !param1;
            if(this.var_37)
            {
               this.var_201.x = this.var_37.x;
               this.var_201.y = this.var_37.y;
               this.var_201.activate();
            }
         }
      }
      
      public function get visible() : Boolean
      {
         return this.var_37 && this.var_37.visible;
      }
      
      public function populate() : void
      {
         var _loc5_:int = 0;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:* = null;
         var _loc1_:int = this.var_1131;
         this.deSelect();
         var _loc2_:IWindowContainer = this.var_37.findChildByName(const_68) as IWindowContainer;
         var _loc3_:IItemListWindow = _loc2_.findChildByName(const_444) as IItemListWindow;
         _loc3_.autoArrangeItems = false;
         var _loc4_:int = _loc3_.numListItems;
         _loc5_ = _loc4_;
         while(_loc5_ > 0)
         {
            _loc3_.removeListItemAt(_loc5_ - 1);
            _loc5_--;
         }
         while(this.var_107.length > 0)
         {
            this.var_107.pop().recycle();
         }
         var _loc6_:int = this.var_106.numFriends + (!!this.var_1132 ? 1 : 0);
         var _loc7_:int = Math.min(this.maxNumOfTabsVisible,_loc6_);
         if(this._startIndex + _loc7_ > _loc6_)
         {
            this._startIndex = Math.max(0,this._startIndex - (this._startIndex + _loc7_ - _loc6_));
         }
         _loc4_ = Math.min(this.var_106.numFriends,this._startIndex + _loc7_);
         _loc5_ = this._startIndex;
         while(_loc5_ < _loc4_)
         {
            _loc8_ = this.var_106.getFriendAt(_loc5_);
            _loc9_ = FriendEntityTab.allocate(_loc8_);
            this.var_107.push(_loc9_);
            _loc3_.addListItem(_loc9_.window);
            _loc5_++;
         }
         if(this.var_1132)
         {
            _loc10_ = this.maxNumOfTabsVisible;
            if(this.var_107.length < _loc10_)
            {
               _loc11_ = const_999;
               if(this.var_107.length + _loc11_ > _loc10_)
               {
                  _loc11_ = this.var_107.length + _loc11_ - _loc10_;
               }
               while(_loc11_-- > 0)
               {
                  _loc12_ = new AddFriendsEntityTab();
                  _loc3_.addListItem(_loc12_.window);
                  this.var_107.push(_loc12_);
               }
            }
         }
         _loc3_.autoArrangeItems = true;
         if(_loc1_ > -1)
         {
            this.selectFriendEntity(_loc1_);
         }
         _loc2_.visible = this.var_107.length > 0;
         this.toggleArrowButtons(this.var_107.length < _loc6_);
      }
      
      private function getFriendEntityTabByID(param1:int) : FriendEntityTab
      {
         var _loc2_:* = null;
         var _loc3_:int = this.var_107.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.var_107[_loc4_] as FriendEntityTab;
            if(_loc2_)
            {
               if(_loc2_.friend.id == param1)
               {
                  return _loc2_;
               }
            }
            _loc4_++;
         }
         return null;
      }
      
      private function onFriendBarDataAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_106 = param2 as IHabboFriendBarData;
         this.var_106.events.addEventListener(FriendBarUpdateEvent.const_694,this.onRefreshView);
         this.var_106.events.addEventListener(FindFriendsNotificationEvent.TYPE,this.onFindFriendsNotification);
         this.var_106.events.addEventListener(FriendRequestEvent.const_1206,this.onFriendRequestUpdate);
         this.var_106.events.addEventListener(NewMessageEvent.const_1286,this.onNewInstantMessage);
      }
      
      private function onWindowManagerAvailable(param1:IID, param2:IUnknown) : void
      {
         this._windowManager = param2 as IHabboWindowManager;
      }
      
      private function isUserInterfaceReady() : Boolean
      {
         return this.var_37 && !this.var_37.disposed;
      }
      
      private function buildUserInterface() : void
      {
         var _loc2_:* = null;
         Tab.var_1065 = this.var_106;
         Tab.var_1064 = this;
         Tab.var_863 = assets;
         Tab.var_1320 = this._windowManager;
         Tab.var_2114 = this.var_1412;
         var _loc1_:IAsset = assets.getAssetByName(const_1363);
         this.var_37 = this._windowManager.buildFromXML(_loc1_.content as XML,const_445) as IWindowContainer;
         this.var_37.x = var_749;
         this.var_37.y = this.var_37.parent.height - (this.var_37.height + const_1365);
         this.var_37.width = this.var_37.parent.width - (var_749 + const_1002);
         this.var_37.setParamFlag(WindowParam.const_251,true);
         this.var_37.procedure = this.barWindowEventProc;
         if(const_1368)
         {
            _loc1_ = assets.getAssetByName(const_1364);
            this.var_201 = this._windowManager.buildFromXML(_loc1_.content as XML,const_445) as IWindowContainer;
            this.var_201.x = this.var_37.x;
            this.var_201.y = this.var_37.y;
            this.var_201.setParamFlag(WindowParam.const_251,true);
            this.var_201.visible = false;
            this.var_201.procedure = this.toggleWindowEventProc;
         }
         if(!this.var_2357)
         {
            _loc2_ = IWindowContainer(this.var_37.findChildByName(const_1001));
            _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onIconMouseEvent);
            _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.onIconMouseEvent);
            _loc2_.addEventListener(WindowMouseEvent.const_25,this.onIconMouseEvent);
            this.var_750 = new FriendListIcon(assets,_loc2_.getChildByName(const_998) as IBitmapWrapperWindow);
            _loc2_ = IWindowContainer(this.var_37.findChildByName(const_1366));
            _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onIconMouseEvent);
            _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.onIconMouseEvent);
            _loc2_.addEventListener(WindowMouseEvent.const_25,this.onIconMouseEvent);
            this.var_496 = new MessengerIcon(assets,_loc2_.getChildByName(const_998) as IBitmapWrapperWindow);
            this.var_496.enable(false);
         }
         this.visible = true;
         this._windowManager.getWindowContext(const_445).getDesktopWindow().addEventListener(WindowEvent.const_41,this.onDesktopResized);
      }
      
      private function onAvatarRendererAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_1108 = param2 as IAvatarRenderManager;
      }
      
      public function getAvatarFaceBitmap(param1:String) : BitmapData
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(!_loc2_)
         {
            if(this.var_1108)
            {
               _loc3_ = this.var_1108.createAvatarImage(param1,AvatarScaleType.const_55,null,this);
               if(_loc3_)
               {
                  _loc2_ = _loc3_.getCroppedImage(AvatarSetType.const_51);
                  _loc3_.dispose();
               }
            }
         }
         return _loc2_;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc3_:IItemListWindow = this.var_37.findChildByName(const_444) as IItemListWindow;
         var _loc4_:int = this.var_106.numFriends;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this.var_106.getFriendAt(_loc5_);
            if(_loc2_.figure == param1)
            {
               _loc6_ = this.getAvatarFaceBitmap(_loc2_.figure);
               if(_loc6_)
               {
                  _loc7_ = _loc3_.getListItemByID(_loc2_.id) as IWindowContainer;
                  if(_loc7_)
                  {
                     _loc8_ = _loc7_.getChildByName(const_444) as IItemListWindow;
                     if(_loc8_)
                     {
                        _loc9_ = IWindowContainer(_loc8_.getListItemByName(const_687));
                        if(_loc9_)
                        {
                           _loc10_ = _loc9_.findChildByName(const_637) as IBitmapWrapperWindow;
                           _loc10_.bitmap = _loc6_;
                           _loc10_.width = _loc6_.width;
                           _loc10_.height = _loc6_.height;
                        }
                     }
                  }
               }
            }
            _loc5_++;
         }
      }
      
      public function faceBookImageReady(param1:BitmapData) : void
      {
      }
      
      private function isFriendSelected(param1:IFriendEntity) : Boolean
      {
         return this.var_1131 == param1.id;
      }
      
      public function selectTab(param1:ITab) : void
      {
         if(!param1.selected)
         {
            if(this.var_1411)
            {
               this.deSelect();
            }
            param1.select();
            this.var_1411 = param1;
         }
      }
      
      public function selectFriendEntity(param1:int) : void
      {
         if(this.var_1131 == param1)
         {
            return;
         }
         var _loc2_:FriendEntityTab = this.getFriendEntityTabByID(param1);
         if(_loc2_)
         {
            this.selectTab(_loc2_);
            this.var_1131 = param1;
         }
      }
      
      public function deSelect() : void
      {
         if(this.var_1411)
         {
            this.var_1411.deselect();
            this.var_1131 = -1;
         }
      }
      
      private function onRefreshView(param1:Event) : void
      {
         if(!this.isUserInterfaceReady())
         {
            this.buildUserInterface();
         }
         this.resizeAndPopulate(true);
      }
      
      private function onFindFriendsNotification(param1:FindFriendsNotificationEvent) : void
      {
         var event:FindFriendsNotificationEvent = param1;
         var title:String = !!event.success ? "${friendbar.find.success.title}" : "${friendbar.find.error.title}";
         var text:String = !!event.success ? "${friendbar.find.success.text}" : "${friendbar.find.error.text}";
         this._windowManager.notify(title,text,function(param1:IAlertDialog, param2:WindowEvent):void
         {
            param1.dispose();
         },HabboAlertDialogFlag.const_530);
      }
      
      private function onFriendRequestUpdate(param1:FriendRequestEvent) : void
      {
         if(this.var_750)
         {
            this.var_750.notify(this.var_106.numFriendRequests > 0);
         }
      }
      
      private function onNewInstantMessage(param1:NewMessageEvent) : void
      {
         if(this.var_496)
         {
            if(param1.notify)
            {
               this.var_496.notify(true);
            }
            else
            {
               this.var_496.enable(true);
            }
         }
      }
      
      private function barWindowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1.type == WindowMouseEvent.const_42)
         {
            _loc3_ = this._startIndex;
            _loc4_ = this.var_106.numFriends + (!!this.var_1132 ? 1 : 0);
            switch(param2.name)
            {
               case const_1003:
                  _loc3_ = Math.max(0,this._startIndex - 1);
                  break;
               case const_1000:
                  _loc3_ = Math.max(0,this._startIndex - this.maxNumOfTabsVisible);
                  break;
               case const_997:
                  _loc3_ = 0;
                  break;
               case const_996:
                  _loc3_ = Math.max(0,Math.min(_loc4_ - this.maxNumOfTabsVisible,this._startIndex + 1));
                  break;
               case const_995:
                  _loc3_ = Math.max(0,Math.min(_loc4_ - this.maxNumOfTabsVisible,this._startIndex + this.maxNumOfTabsVisible));
                  break;
               case const_994:
                  _loc3_ = Math.max(0,_loc4_ - this.maxNumOfTabsVisible);
                  break;
               case const_1301:
                  this.visible = false;
                  break;
               case const_1362:
                  this.deSelect();
            }
            if(_loc3_ != this._startIndex)
            {
               this.deSelect();
               this._startIndex = _loc3_;
               this.resizeAndPopulate(true);
            }
         }
         if(param1.type == WindowEvent.const_510)
         {
            this.deSelect();
         }
      }
      
      private function onIconMouseEvent(param1:WindowMouseEvent) : void
      {
         var _loc2_:Icon = param1.window.name == const_1001 ? this.var_750 : this.var_496;
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(_loc2_ is FriendListIcon)
               {
                  this.var_106.toggleFriendList();
                  _loc2_.notify(false);
               }
               else if(_loc2_ is MessengerIcon)
               {
                  this.var_106.toggleMessenger();
                  _loc2_.notify(false);
               }
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               _loc2_.hover(true);
               break;
            case WindowMouseEvent.const_25:
               _loc2_.hover(false);
         }
      }
      
      private function toggleWindowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(this.var_201.visible)
         {
            if(param1.type == WindowMouseEvent.const_42)
            {
               switch(param2.name)
               {
                  case const_1367:
                     this.visible = true;
               }
            }
         }
      }
      
      private function toggleArrowButtons(param1:Boolean) : void
      {
         var _loc2_:* = null;
         _loc2_ = this.var_37.findChildByName(const_996);
         if(_loc2_)
         {
            _loc2_.visible = param1;
         }
         _loc2_ = this.var_37.findChildByName(const_995);
         if(_loc2_)
         {
            _loc2_.visible = param1;
         }
         _loc2_ = this.var_37.findChildByName(const_994);
         if(_loc2_)
         {
            _loc2_.visible = param1;
         }
         _loc2_ = this.var_37.findChildByName(const_1003);
         if(_loc2_)
         {
            _loc2_.visible = param1;
         }
         _loc2_ = this.var_37.findChildByName(const_1000);
         if(_loc2_)
         {
            _loc2_.visible = param1;
         }
         _loc2_ = this.var_37.findChildByName(const_997);
         if(_loc2_)
         {
            _loc2_.visible = param1;
         }
      }
      
      private function resizeAndPopulate(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         if(!disposed)
         {
            if(this.var_37)
            {
               this.var_37.width = this.var_37.parent.width - (var_749 + const_1002);
               if(!param1)
               {
                  _loc2_ = this.maxNumOfTabsVisible;
                  if(_loc2_ < this.var_107.length)
                  {
                     param1 = true;
                  }
                  else if(_loc2_ > this.var_107.length)
                  {
                     if(this.var_107.length < const_999)
                     {
                        param1 = true;
                     }
                     else if(this.var_107.length < this.var_106.numFriends + (!!this.var_1132 ? 1 : 0))
                     {
                        param1 = true;
                     }
                     else if(this.numFriendEntityTabsVisible < this.var_106.numFriends)
                     {
                        param1 = true;
                     }
                  }
               }
               if(param1)
               {
                  this.populate();
               }
            }
         }
      }
      
      private function get numFriendEntityTabsVisible() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = this.var_107.length;
         while(_loc2_-- > 0)
         {
            if(this.var_107[_loc2_] is FriendEntityTab)
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      private function get maxNumOfTabsVisible() : int
      {
         var _loc1_:IWindowContainer = this.var_37.findChildByName(const_68) as IWindowContainer;
         var _loc2_:IWindowContainer = _loc1_.getChildByName("wrapper") as IWindowContainer;
         var _loc3_:IItemListWindow = _loc2_.findChildByName(const_444) as IItemListWindow;
         var _loc4_:int = _loc2_.width - _loc3_.width;
         return (_loc1_.width - _loc4_) / (const_1361 + _loc3_.spacing);
      }
      
      private function onDesktopResized(param1:WindowEvent) : void
      {
         this.resizeAndPopulate(false);
      }
   }
}
