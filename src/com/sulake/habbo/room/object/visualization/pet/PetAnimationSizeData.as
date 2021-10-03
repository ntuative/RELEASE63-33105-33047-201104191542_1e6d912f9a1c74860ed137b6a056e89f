package com.sulake.habbo.room.object.visualization.pet
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.room.object.visualization.data.AnimationSizeData;
   import com.sulake.room.utils.XMLValidator;
   
   public class PetAnimationSizeData extends AnimationSizeData
   {
      
      public static const const_762:int = -1;
       
      
      private var var_646:Map;
      
      private var var_805:Map;
      
      private var var_804:String;
      
      public function PetAnimationSizeData(param1:int, param2:int)
      {
         this.var_646 = new Map();
         this.var_805 = new Map();
         super(param1,param2);
      }
      
      public function definePostures(param1:XML) : Boolean
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         if(param1 == null)
         {
            return false;
         }
         if(XMLValidator.checkRequiredAttributes(param1,["defaultPosture"]))
         {
            this.var_804 = param1.@defaultPosture;
         }
         else
         {
            this.var_804 = null;
         }
         var _loc2_:* = ["id","animationId"];
         var _loc3_:XMLList = param1.posture;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length())
         {
            _loc5_ = _loc3_[_loc4_];
            if(!XMLValidator.checkRequiredAttributes(_loc5_,_loc2_))
            {
               return false;
            }
            _loc6_ = String(_loc5_.@id);
            _loc7_ = int(_loc5_.@animationId);
            this.var_646.add(_loc6_,_loc7_);
            if(this.var_804 == null)
            {
               this.var_804 = _loc6_;
            }
            _loc4_++;
         }
         if(this.var_646.getValue(this.var_804) == null)
         {
            return false;
         }
         return true;
      }
      
      public function defineGestures(param1:XML) : Boolean
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         if(param1 == null)
         {
            return true;
         }
         var _loc2_:* = ["id","animationId"];
         var _loc3_:XMLList = param1.gesture;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length())
         {
            _loc5_ = _loc3_[_loc4_];
            if(!XMLValidator.checkRequiredAttributes(_loc5_,_loc2_))
            {
               return false;
            }
            _loc6_ = String(_loc5_.@id);
            _loc7_ = int(_loc5_.@animationId);
            this.var_805.add(_loc6_,_loc7_);
            _loc4_++;
         }
         return true;
      }
      
      public function getAnimationForPosture(param1:String) : int
      {
         if(this.var_646.getValue(param1) == null)
         {
            param1 = this.var_804;
         }
         return int(this.var_646.getValue(param1));
      }
      
      public function getAnimationForGesture(param1:String) : int
      {
         if(this.var_805.getValue(param1) == null)
         {
            return const_762;
         }
         return int(this.var_805.getValue(param1));
      }
      
      public function getPostureForAnimation(param1:int) : String
      {
         if(param1 >= 0 && param1 < this.var_646.length)
         {
            return this.var_646.getKey(param1);
         }
         return this.var_804;
      }
      
      public function getGestureForAnimation(param1:int) : String
      {
         if(param1 >= 0 && param1 < this.var_805.length)
         {
            return this.var_805.getKey(param1);
         }
         return null;
      }
      
      public function getPostureCount() : int
      {
         return this.var_646.length;
      }
      
      public function getGestureCount() : int
      {
         return this.var_805.length;
      }
   }
}
