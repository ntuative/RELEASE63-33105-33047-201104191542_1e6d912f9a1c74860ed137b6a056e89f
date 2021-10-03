package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1954:int;
      
      private var _name:String;
      
      private var var_1398:int;
      
      private var var_2715:int;
      
      private var var_2224:int;
      
      private var _energy:int;
      
      private var _nutrition:int;
      
      private var var_622:String;
      
      private var var_2712:int;
      
      private var var_2713:int;
      
      private var var_2714:int;
      
      private var var_2223:int;
      
      private var var_2227:int;
      
      private var _ownerName:String;
      
      private var var_540:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1954;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get level() : int
      {
         return this.var_1398;
      }
      
      public function get maxLevel() : int
      {
         return this.var_2715;
      }
      
      public function get experience() : int
      {
         return this.var_2224;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get figure() : String
      {
         return this.var_622;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return this.var_2712;
      }
      
      public function get maxEnergy() : int
      {
         return this.var_2713;
      }
      
      public function get maxNutrition() : int
      {
         return this.var_2714;
      }
      
      public function get respect() : int
      {
         return this.var_2223;
      }
      
      public function get ownerId() : int
      {
         return this.var_2227;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get age() : int
      {
         return this.var_540;
      }
      
      public function flush() : Boolean
      {
         this.var_1954 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1954 = param1.readInteger();
         this._name = param1.readString();
         this.var_1398 = param1.readInteger();
         this.var_2715 = param1.readInteger();
         this.var_2224 = param1.readInteger();
         this.var_2712 = param1.readInteger();
         this._energy = param1.readInteger();
         this.var_2713 = param1.readInteger();
         this._nutrition = param1.readInteger();
         this.var_2714 = param1.readInteger();
         this.var_622 = param1.readString();
         this.var_2223 = param1.readInteger();
         this.var_2227 = param1.readInteger();
         this.var_540 = param1.readInteger();
         this._ownerName = param1.readString();
         return true;
      }
   }
}
