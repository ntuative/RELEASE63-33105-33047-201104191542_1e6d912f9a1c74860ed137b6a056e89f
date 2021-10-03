package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1954:int;
      
      private var var_1398:int;
      
      private var var_2226:int;
      
      private var var_2224:int;
      
      private var var_2228:int;
      
      private var _energy:int;
      
      private var var_2225:int;
      
      private var _nutrition:int;
      
      private var var_2222:int;
      
      private var var_2227:int;
      
      private var _ownerName:String;
      
      private var var_2223:int;
      
      private var var_540:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1954;
      }
      
      public function get level() : int
      {
         return this.var_1398;
      }
      
      public function get levelMax() : int
      {
         return this.var_2226;
      }
      
      public function get experience() : int
      {
         return this.var_2224;
      }
      
      public function get experienceMax() : int
      {
         return this.var_2228;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get energyMax() : int
      {
         return this.var_2225;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get nutritionMax() : int
      {
         return this.var_2222;
      }
      
      public function get ownerId() : int
      {
         return this.var_2227;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get respect() : int
      {
         return this.var_2223;
      }
      
      public function get age() : int
      {
         return this.var_540;
      }
      
      public function set petId(param1:int) : void
      {
         this.var_1954 = param1;
      }
      
      public function set level(param1:int) : void
      {
         this.var_1398 = param1;
      }
      
      public function set levelMax(param1:int) : void
      {
         this.var_2226 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         this.var_2224 = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         this.var_2228 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         this._energy = param1;
      }
      
      public function set energyMax(param1:int) : void
      {
         this.var_2225 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         this._nutrition = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         this.var_2222 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         this.var_2227 = param1;
      }
      
      public function set ownerName(param1:String) : void
      {
         this._ownerName = param1;
      }
      
      public function set respect(param1:int) : void
      {
         this.var_2223 = param1;
      }
      
      public function set age(param1:int) : void
      {
         this.var_540 = param1;
      }
   }
}
