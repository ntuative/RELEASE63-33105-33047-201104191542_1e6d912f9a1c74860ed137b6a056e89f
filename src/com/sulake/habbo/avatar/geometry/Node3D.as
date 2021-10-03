package com.sulake.habbo.avatar.geometry
{
   public class Node3D
   {
       
      
      private var var_432:Vector3D;
      
      private var var_2010:Vector3D;
      
      private var var_2792:Boolean = false;
      
      public function Node3D(param1:Number, param2:Number, param3:Number)
      {
         this.var_2010 = new Vector3D();
         super();
         this.var_432 = new Vector3D(param1,param2,param3);
         if(param1 != 0 || param2 != 0 || param3 != 0)
         {
            this.var_2792 = true;
         }
      }
      
      public function get location() : Vector3D
      {
         return this.var_432;
      }
      
      public function get transformedLocation() : Vector3D
      {
         return this.var_2010;
      }
      
      public function applyTransform(param1:Matrix4x4) : void
      {
         if(this.var_2792)
         {
            this.var_2010 = param1.vectorMultiplication(this.var_432);
         }
      }
   }
}
