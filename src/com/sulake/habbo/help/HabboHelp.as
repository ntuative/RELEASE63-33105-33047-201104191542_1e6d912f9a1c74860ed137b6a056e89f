package com.sulake.habbo.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.cfh.data.CallForHelpData;
   import com.sulake.habbo.help.cfh.data.UserRegistry;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.HelpUI;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.help.hotelmerge.HotelMergeUI;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboHelp extends Component implements IHabboHelp
   {
       
      
      private var _toolbar:IHabboToolbar;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_266:IHabboCommunicationManager;
      
      private var var_1027:IHabboLocalizationManager;
      
      private var var_836:IHabboConfigurationManager;
      
      private var var_417:ISessionDataManager;
      
      private var var_1287:FaqIndex;
      
      private var var_1445:IncomingMessages;
      
      private var var_68:HelpUI;
      
      private var var_111:TutorialUI;
      
      private var var_835:HotelMergeUI;
      
      private var var_1566:CallForHelpData;
      
      private var var_2774:UserRegistry;
      
      private var var_2423:String = "";
      
      private var var_667:WelcomeScreenController;
      
      public function HabboHelp(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         this.var_1566 = new CallForHelpData();
         this.var_2774 = new UserRegistry();
         super(param1,param2,param3);
         this._assetLibrary = param3;
         this.var_1287 = new FaqIndex();
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
         queueInterface(new IIDSessionDataManager(),this.onSessionDataManagerReady);
      }
      
      public function set ownUserName(param1:String) : void
      {
         this.var_2423 = param1;
      }
      
      public function get ownUserName() : String
      {
         return this.var_2423;
      }
      
      public function get callForHelpData() : CallForHelpData
      {
         return this.var_1566;
      }
      
      public function get userRegistry() : UserRegistry
      {
         return this.var_2774;
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return this.var_1027;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this._windowManager;
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return this._toolbar;
      }
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return this.var_417;
      }
      
      public function get tutorialUI() : TutorialUI
      {
         return this.var_111;
      }
      
      public function get hotelMergeUI() : HotelMergeUI
      {
         return this.var_835;
      }
      
      public function hasChangedName() : Boolean
      {
         if(this.var_111)
         {
            return this.var_111.hasChangedName;
         }
         return true;
      }
      
      override public function dispose() : void
      {
         if(this.var_68 != null)
         {
            this.var_68.dispose();
            this.var_68 = null;
         }
         if(this.var_111 != null)
         {
            this.var_111.dispose();
            this.var_111 = null;
         }
         if(this.var_835)
         {
            this.var_835.dispose();
            this.var_835 = null;
         }
         if(this.var_1287 != null)
         {
            this.var_1287.dispose();
            this.var_1287 = null;
         }
         this.var_1445 = null;
         if(this._toolbar)
         {
            this._toolbar.release(new IIDHabboToolbar());
            this._toolbar = null;
         }
         if(this.var_1027)
         {
            this.var_1027.release(new IIDHabboLocalizationManager());
            this.var_1027 = null;
         }
         if(this.var_266)
         {
            this.var_266.release(new IIDHabboCommunicationManager());
            this.var_266 = null;
         }
         if(this.var_836)
         {
            this.var_836.release(new IIDHabboConfigurationManager());
            this.var_836 = null;
         }
         if(this._windowManager)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         if(this.var_417 != null)
         {
            this.var_417.release(new IIDSessionDataManager());
            this.var_417 = null;
         }
         if(this.var_667 != null)
         {
            this.var_667.dispose();
            this.var_667 = null;
         }
         super.dispose();
      }
      
      public function showUI(param1:String = null) : void
      {
         if(this.var_68 != null)
         {
            this.var_68.showUI(param1);
         }
      }
      
      public function hideUI() : void
      {
         if(this.var_68 != null)
         {
            this.var_68.hideUI();
         }
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(this.var_68 != null)
         {
            this.var_68.tellUI(param1,param2);
         }
      }
      
      public function enableCallForGuideBotUI() : void
      {
         if(this.var_68 != null)
         {
            this.var_68.updateCallForGuideBotUI(true);
         }
      }
      
      public function disableCallForGuideBotUI() : void
      {
         if(this.var_68 != null)
         {
            this.var_68.updateCallForGuideBotUI(false);
         }
      }
      
      public function getFaq() : FaqIndex
      {
         return this.var_1287;
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         if(this.var_266 != null && param1 != null)
         {
            this.var_266.getHabboMainConnection(null).send(param1);
         }
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         if(this.var_836 == null)
         {
            return param1;
         }
         return this.var_836.getKey(param1,param2,param3);
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         if(this.var_68 != null)
         {
            this.var_68.showCallForHelpReply(param1);
         }
      }
      
      public function showCallForHelpResult(param1:String) : void
      {
         if(this.var_68 != null)
         {
            this.var_68.showCallForHelpResult(param1);
         }
      }
      
      public function reportUser(param1:int, param2:String) : void
      {
         this.var_1566.reportedUserId = param1;
         this.var_1566.reportedUserName = param2;
         this.var_68.showUI(HabboHelpViewEnum.const_418);
      }
      
      private function toggleHelpUI() : void
      {
         if(this.var_68 == null)
         {
            if(!this.createHelpUI())
            {
               return;
            }
         }
         this.var_68.toggleUI();
      }
      
      private function createHelpUI() : Boolean
      {
         if(this.var_68 == null && this._assetLibrary != null && this._windowManager != null)
         {
            this.var_68 = new HelpUI(this,this._assetLibrary,this._windowManager,this.var_1027,this._toolbar);
         }
         return this.var_68 != null;
      }
      
      private function createTutorialUI() : Boolean
      {
         var _loc1_:* = false;
         if(this.var_111 == null && this._assetLibrary != null && this._windowManager != null)
         {
            _loc1_ = this.getConfigurationKey("avatar.widget.enabled","0") == "0";
            this.var_111 = new TutorialUI(this,_loc1_);
         }
         return this.var_111 != null;
      }
      
      public function removeTutorialUI() : void
      {
         if(this.var_111 != null)
         {
            this.var_111.dispose();
            this.var_111 = null;
         }
      }
      
      public function initHotelMergeUI() : void
      {
         if(!this.var_835)
         {
            this.var_835 = new HotelMergeUI(this);
         }
         this.var_835.startNameChange();
      }
      
      public function updateTutorial(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         if(param1 && param2 && param3)
         {
            this.removeTutorialUI();
            return;
         }
         if(this.var_111 == null)
         {
            if(!this.createTutorialUI())
            {
               return;
            }
         }
         this.var_111.update(param1,param2,param3);
      }
      
      public function startNameChange() : void
      {
         if(this.var_111)
         {
            this.var_111.showView(TutorialUI.const_348);
         }
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationManagerReady);
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_266 = IHabboCommunicationManager(param2);
         this.var_1445 = new IncomingMessages(this,this.var_266);
         queueInterface(new IIDHabboToolbar(),this.onToolbarReady);
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._toolbar = IHabboToolbar(param2);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationManagerReady);
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_1027 = IHabboLocalizationManager(param2);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationManagerReady);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_836 = IHabboConfigurationManager(param2);
         queueInterface(new IIDHabboRoomSessionManager(),this.onRoomSessionManagerReady);
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IRoomSessionManager = IRoomSessionManager(param2);
         _loc3_.events.addEventListener(RoomSessionEvent.const_86,this.onRoomSessionEvent);
         _loc3_.events.addEventListener(RoomSessionEvent.const_97,this.onRoomSessionEvent);
         this._toolbar.events.addEventListener(HabboToolbarEvent.const_75,this.onHabboToolbarEvent);
         this._toolbar.events.addEventListener(HabboToolbarEvent.const_36,this.onHabboToolbarEvent);
         this.createHelpUI();
         this.setHabboToolbarIcon();
      }
      
      private function onSessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_417 = param2 as ISessionDataManager;
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_86:
               if(this.var_68 != null)
               {
                  this.var_68.setRoomSessionStatus(true);
               }
               if(this.var_111 != null)
               {
                  this.var_111.setRoomSessionStatus(true);
               }
               this.showWelcomeScreen(true);
               break;
            case RoomSessionEvent.const_97:
               if(this.var_68 != null)
               {
                  this.var_68.setRoomSessionStatus(false);
               }
               if(this.var_111 != null)
               {
                  this.var_111.setRoomSessionStatus(false);
               }
               this.userRegistry.unregisterRoom();
               this.showWelcomeScreen(false);
         }
      }
      
      private function showWelcomeScreen(param1:Boolean) : void
      {
         if(!this.var_667)
         {
            this.var_667 = new WelcomeScreenController(this,this._windowManager,this.var_836);
         }
         this.var_667.showWelcomeScreen(param1);
      }
      
      private function setHabboToolbarIcon() : void
      {
         if(this._toolbar != null)
         {
            this._toolbar.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_117,HabboToolbarIconEnum.HELP));
         }
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_75)
         {
            this.setHabboToolbarIcon();
            return;
         }
         if(param1.type == HabboToolbarEvent.const_36)
         {
            if(param1.iconId == HabboToolbarIconEnum.HELP)
            {
               this.toggleHelpUI();
               return;
            }
         }
      }
      
      public function setWelcomeNotifications(param1:Array) : void
      {
         if(!this.var_667)
         {
            this.showWelcomeScreen(true);
         }
         this.var_667.notifications = param1;
      }
   }
}
