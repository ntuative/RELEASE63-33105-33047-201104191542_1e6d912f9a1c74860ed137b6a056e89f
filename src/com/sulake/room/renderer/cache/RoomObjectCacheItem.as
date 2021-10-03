package com.sulake.room.renderer.cache
{
   public class RoomObjectCacheItem
   {
       
      
      private var var_432:RoomObjectLocationCacheItem = null;
      
      private var var_200:RoomObjectSortableSpriteCacheItem = null;
      
      public function RoomObjectCacheItem(param1:String)
      {
         super();
         this.var_432 = new RoomObjectLocationCacheItem(param1);
         this.var_200 = new RoomObjectSortableSpriteCacheItem();
      }
      
      public function get location() : RoomObjectLocationCacheItem
      {
         return this.var_432;
      }
      
      public function get sprites() : RoomObjectSortableSpriteCacheItem
      {
         return this.var_200;
      }
      
      public function dispose() : void
      {
         if(this.var_432 != null)
         {
            this.var_432.dispose();
            this.var_432 = null;
         }
         if(this.var_200 != null)
         {
            this.var_200.dispose();
            this.var_200 = null;
         }
      }
   }
}
