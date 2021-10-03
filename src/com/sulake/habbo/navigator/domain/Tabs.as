package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_419:int = 1;
      
      public static const const_266:int = 2;
      
      public static const const_315:int = 3;
      
      public static const const_385:int = 4;
      
      public static const const_250:int = 5;
      
      public static const const_420:int = 1;
      
      public static const const_864:int = 2;
      
      public static const const_689:int = 3;
      
      public static const const_841:int = 4;
      
      public static const const_269:int = 5;
      
      public static const const_826:int = 6;
      
      public static const const_726:int = 7;
      
      public static const const_226:int = 8;
      
      public static const const_434:int = 9;
      
      public static const const_2016:int = 10;
      
      public static const const_928:int = 11;
      
      public static const const_567:int = 12;
       
      
      private var var_458:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_458 = new Array();
         this.var_458.push(new Tab(this._navigator,const_419,const_567,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_563));
         this.var_458.push(new Tab(this._navigator,const_266,const_420,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_563));
         this.var_458.push(new Tab(this._navigator,const_385,const_928,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1108));
         this.var_458.push(new Tab(this._navigator,const_315,const_269,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_563));
         this.var_458.push(new Tab(this._navigator,const_250,const_226,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_712));
         this.setSelectedTab(const_419);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_385;
      }
      
      public function get tabs() : Array
      {
         return this.var_458;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_458)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_458)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_458)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
