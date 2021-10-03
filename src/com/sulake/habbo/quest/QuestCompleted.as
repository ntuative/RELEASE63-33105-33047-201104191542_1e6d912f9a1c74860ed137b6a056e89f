package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   import com.sulake.habbo.communication.messages.outgoing.quest.OpenQuestTrackerMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.quest.RejectQuestMessageComposer;
   
   public class QuestCompleted implements IDisposable
   {
       
      
      private var _window:IFrameWindow;
      
      private var _questEngine:HabboQuestEngine;
      
      private var var_721:QuestMessageData;
      
      public function QuestCompleted(param1:HabboQuestEngine)
      {
         super();
         this._questEngine = param1;
      }
      
      public function dispose() : void
      {
         if(this._window)
         {
            this._window.dispose();
            this._window = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._window == null;
      }
      
      private function onClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this._window.visible = false;
            this._questEngine.send(new RejectQuestMessageComposer());
         }
      }
      
      private function onNextQuest(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this._questEngine.controller.openDetailsForNextQuest = this._questEngine.configuration.getKey("questing.showDetailsForNextQuest") == "true";
            this._questEngine.send(new OpenQuestTrackerMessageComposer());
            this._window.visible = false;
         }
      }
      
      public function prepare(param1:QuestMessageData) : void
      {
         var _loc4_:* = null;
         this.var_721 = param1;
         if(this._window == null)
         {
            this._window = IFrameWindow(this._questEngine.getXmlWindow("QuestCompletedDialog"));
            this._window.findChildByTag("close").procedure = this.onClose;
            this._window.findChildByName("next_quest_button").procedure = this.onNextQuest;
            new PendingImage(this._questEngine,this._window.findChildByName("reward_icon"),"quest_complete");
            _loc4_ = this._window.findChildByName("catalog_link_txt");
            _loc4_.mouseThreshold = 0;
            _loc4_.procedure = this.onRewardInfo;
         }
         this._window.findChildByName("catalog_link_txt").caption = this._questEngine.localization.getKey("quests.completed.cataloglink." + this.var_721.activityPointType);
         var _loc2_:String = "quests.completed.reward." + this.var_721.activityPointType;
         this._questEngine.localization.registerParameter(_loc2_,"amount",this.var_721.rewardCurrencyAmount.toString());
         this._window.findChildByName("reward_txt").caption = this._questEngine.localization.getKey(_loc2_,_loc2_);
         var _loc3_:* = this.var_721.getQuestLocalizationKey() + ".completed";
         this._window.findChildByName("desc_txt").caption = this._questEngine.localization.getKey(_loc3_,_loc3_);
         this._window.visible = false;
      }
      
      public function show() : void
      {
         this._window.center();
         this._window.visible = true;
         this._window.activate();
      }
      
      public function onRewardInfo(param1:WindowEvent, param2:IWindow = null) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this.var_721)
         {
            return;
         }
         var _loc3_:String = "catalog.page.quest." + this.var_721.campaignCode;
         Logger.log("Questing->Open Catalog: " + _loc3_);
         this._questEngine.openCatalog(_loc3_);
         param1.stopPropagation();
         param1.stopImmediatePropagation();
      }
   }
}
