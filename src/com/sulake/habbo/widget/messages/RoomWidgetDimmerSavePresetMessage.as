package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_719:String = "RWSDPM_SAVE_PRESET";
       
      
      private var var_2840:int;
      
      private var var_2841:int;
      
      private var _color:uint;
      
      private var var_1175:int;
      
      private var var_2885:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_719);
         this.var_2840 = param1;
         this.var_2841 = param2;
         this._color = param3;
         this.var_1175 = param4;
         this.var_2885 = param5;
      }
      
      public function get presetNumber() : int
      {
         return this.var_2840;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_2841;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_1175;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2885;
      }
   }
}
