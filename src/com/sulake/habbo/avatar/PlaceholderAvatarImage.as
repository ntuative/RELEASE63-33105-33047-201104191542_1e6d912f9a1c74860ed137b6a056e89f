package com.sulake.habbo.avatar
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import flash.display.BitmapData;
   
   public class PlaceholderAvatarImage extends AvatarImage
   {
      
      static var var_780:Map = new Map();
       
      
      public function PlaceholderAvatarImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:AvatarFigureContainer, param4:String)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(!var_1071)
         {
            _structure = null;
            _assets = null;
            var_245 = null;
            var_284 = null;
            var_622 = null;
            var_562 = null;
            var_329 = null;
            if(!var_1331 && var_49)
            {
               var_49.dispose();
            }
            var_49 = null;
            _loc1_ = getCache();
            if(_loc1_)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_727 = null;
            var_1071 = true;
         }
      }
      
      override protected function getFullImage(param1:String) : BitmapData
      {
         return var_780[param1];
      }
      
      override protected function cacheFullImage(param1:String, param2:BitmapData) : void
      {
         var_780[param1] = param2;
      }
      
      override public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:* = null;
         if(rest != null && rest.length > 0)
         {
            _loc3_ = rest[0];
         }
         switch(param1)
         {
            case AvatarAction.const_398:
               switch(_loc3_)
               {
                  case AvatarAction.const_702:
                  case AvatarAction.const_489:
                  case AvatarAction.const_402:
                  case AvatarAction.const_756:
                  case AvatarAction.const_366:
                  case AvatarAction.const_742:
                     super.appendAction.apply(null,[param1].concat(rest));
               }
               break;
            case AvatarAction.const_312:
            case AvatarAction.DANCE:
            case AvatarAction.WAVE:
            case AvatarAction.const_847:
            case AvatarAction.const_895:
            case AvatarAction.const_865:
               super.addActionData.apply(null,[param1].concat(rest));
         }
         return true;
      }
      
      override public function isPlaceholder() : Boolean
      {
         return true;
      }
   }
}
