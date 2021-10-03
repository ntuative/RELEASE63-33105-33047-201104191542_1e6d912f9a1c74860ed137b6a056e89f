package com.sulake.habbo.room.object.logic
{
   import com.sulake.habbo.room.messages.RoomObjectMoveUpdateMessage;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.logic.ObjectLogicBase;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class MovingObjectLogic extends ObjectLogicBase
   {
      
      public static const const_955:int = 500;
      
      private static var var_1021:Vector3d = new Vector3d();
       
      
      private var var_538:Vector3d;
      
      private var var_94:Vector3d;
      
      private var var_1956:int = 0;
      
      private var var_2716:int;
      
      private var var_1273:int = 500;
      
      public function MovingObjectLogic()
      {
         this.var_538 = new Vector3d();
         this.var_94 = new Vector3d();
         super();
      }
      
      protected function get lastUpdateTime() : int
      {
         return this.var_1956;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.var_94 = null;
         this.var_538 = null;
      }
      
      protected function set moveUpdateInterval(param1:int) : void
      {
         if(param1 <= 0)
         {
            param1 = 1;
         }
         this.var_1273 = param1;
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         super.processUpdateMessage(param1);
         var _loc2_:RoomObjectMoveUpdateMessage = param1 as RoomObjectMoveUpdateMessage;
         if(_loc2_ == null)
         {
            return;
         }
         if(object != null)
         {
            if(param1.loc != null)
            {
               this.var_94.assign(param1.loc);
               _loc3_ = _loc2_.targetLoc;
               this.var_2716 = this.var_1956;
               this.var_538.assign(_loc3_);
               this.var_538.sub(this.var_94);
            }
         }
      }
      
      override public function update(param1:int) : void
      {
         var _loc2_:int = 0;
         if(this.var_538.length > 0)
         {
            _loc2_ = param1 - this.var_2716;
            if(_loc2_ > this.var_1273)
            {
               _loc2_ = this.var_1273;
            }
            var_1021.assign(this.var_538);
            var_1021.mul(_loc2_ / Number(this.var_1273));
            var_1021.add(this.var_94);
            if(object != null)
            {
               object.setLocation(var_1021);
            }
            if(_loc2_ == this.var_1273)
            {
               this.var_538.x = 0;
               this.var_538.y = 0;
               this.var_538.z = 0;
            }
         }
         this.var_1956 = param1;
      }
   }
}
