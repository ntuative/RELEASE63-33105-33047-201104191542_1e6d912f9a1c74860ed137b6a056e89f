package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_2733:String;
      
      private var var_1970:String;
      
      private var var_2732:String;
      
      private var var_1972:Boolean;
      
      private var var_1971:int = -1;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_2733 = String(param1["set-type"]);
         this.var_1970 = String(param1["flipped-set-type"]);
         this.var_2732 = String(param1["remove-set-type"]);
         this.var_1972 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_1971 >= 0;
      }
      
      public function get staticId() : int
      {
         return this.var_1971;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_1971 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_2733;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_1970;
      }
      
      public function get removeSetType() : String
      {
         return this.var_2732;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_1972;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_1972 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_1970 = param1;
      }
   }
}
