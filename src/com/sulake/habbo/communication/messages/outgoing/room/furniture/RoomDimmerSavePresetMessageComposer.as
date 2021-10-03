package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2840:int;
      
      private var var_2841:int;
      
      private var var_2838:String;
      
      private var var_2839:int;
      
      private var var_2842:Boolean;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         this._roomId = param6;
         this._roomCategory = param7;
         this.var_2840 = param1;
         this.var_2841 = param2;
         this.var_2838 = param3;
         this.var_2839 = param4;
         this.var_2842 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2840,this.var_2841,this.var_2838,this.var_2839,int(this.var_2842)];
      }
      
      public function dispose() : void
      {
      }
   }
}
