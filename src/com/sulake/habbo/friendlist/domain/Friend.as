package com.sulake.habbo.friendlist.domain
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   import com.sulake.habbo.friendlist.IFriend;
   import flash.display.BitmapData;
   
   public class Friend implements IFriend, IDisposable
   {
      
      public static const const_1867:int = "F".charCodeAt(0);
      
      public static const const_2057:int = "M".charCodeAt(0);
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_943:int;
      
      private var var_717:Boolean;
      
      private var var_1806:Boolean;
      
      private var var_622:String;
      
      private var var_1945:String;
      
      private var var_1670:String;
      
      private var var_1599:int;
      
      private var _selected:Boolean;
      
      private var _disposed:Boolean;
      
      private var _view:IWindowContainer;
      
      private var var_1265:BitmapData;
      
      private var var_1668:String;
      
      public function Friend(param1:FriendData)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         this._id = param1.id;
         this._name = param1.name;
         this.var_943 = param1.gender;
         this.var_717 = param1.online;
         this.var_1806 = param1.followingAllowed && param1.online;
         this.var_622 = param1.figure;
         this.var_1945 = param1.motto;
         this.var_1670 = param1.lastAccess;
         this.var_1599 = param1.categoryId;
         this.var_1668 = param1.realName;
         Logger.log("Creating friend: " + this.id + ", " + this.name + ", " + this.gender + ", " + this.online + ", " + this.followingAllowed + ", " + this.figure + ", " + this.categoryId);
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         if(this.var_1265 != null)
         {
            this.var_1265.dispose();
            this.var_1265 = null;
         }
         this._disposed = true;
         this._view = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_943;
      }
      
      public function get online() : Boolean
      {
         return this.var_717;
      }
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1806;
      }
      
      public function get figure() : String
      {
         return this.var_622;
      }
      
      public function get motto() : String
      {
         return this.var_1945;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1670;
      }
      
      public function get categoryId() : int
      {
         return this.var_1599;
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function get view() : IWindowContainer
      {
         return this._view;
      }
      
      public function get face() : BitmapData
      {
         return this.var_1265;
      }
      
      public function get realName() : String
      {
         return this.var_1668;
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function set gender(param1:int) : void
      {
         this.var_943 = param1;
      }
      
      public function set online(param1:Boolean) : void
      {
         this.var_717 = param1;
      }
      
      public function set followingAllowed(param1:Boolean) : void
      {
         this.var_1806 = param1;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_622 = param1;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1945 = param1;
      }
      
      public function set lastAccess(param1:String) : void
      {
         this.var_1670 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1599 = param1;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this._selected = param1;
      }
      
      public function set view(param1:IWindowContainer) : void
      {
         this._view = param1;
      }
      
      public function set face(param1:BitmapData) : void
      {
         this.var_1265 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1668 = param1;
      }
   }
}
