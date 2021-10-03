package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1030:BigInteger;
      
      private var var_2257:BigInteger;
      
      private var var_2013:BigInteger;
      
      private var var_2796:BigInteger;
      
      private var var_1573:BigInteger;
      
      private var var_2012:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1573 = param1;
         this.var_2012 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1573.toString() + ",generator: " + this.var_2012.toString() + ",secret: " + param1);
         this.var_1030 = new BigInteger();
         this.var_1030.fromRadix(param1,param2);
         this.var_2257 = this.var_2012.modPow(this.var_1030,this.var_1573);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_2013 = new BigInteger();
         this.var_2013.fromRadix(param1,param2);
         this.var_2796 = this.var_2013.modPow(this.var_1030,this.var_1573);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2257.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2796.toRadix(param1);
      }
   }
}
