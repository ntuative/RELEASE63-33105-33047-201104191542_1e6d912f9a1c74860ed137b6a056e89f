package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1952:int = 0;
      
      public static const const_1669:int = 1;
      
      public static const const_1501:int = 2;
      
      public static const const_1931:int = 3;
      
      public static const const_2020:int = 4;
      
      public static const const_1938:int = 5;
      
      public static const const_1516:int = 10;
      
      public static const const_2006:int = 11;
      
      public static const const_1879:int = 12;
      
      public static const const_1983:int = 13;
      
      public static const const_1878:int = 16;
      
      public static const const_2018:int = 17;
      
      public static const const_1910:int = 18;
      
      public static const const_2034:int = 19;
      
      public static const const_1900:int = 20;
      
      public static const const_1962:int = 22;
      
      public static const const_2051:int = 23;
      
      public static const const_1979:int = 24;
      
      public static const const_1925:int = 25;
      
      public static const const_2027:int = 26;
      
      public static const const_2023:int = 27;
      
      public static const const_1957:int = 28;
      
      public static const const_1894:int = 29;
      
      public static const const_2003:int = 100;
      
      public static const const_1914:int = 101;
      
      public static const const_1885:int = 102;
      
      public static const const_2043:int = 103;
      
      public static const const_2064:int = 104;
      
      public static const const_1875:int = 105;
      
      public static const const_1949:int = 106;
      
      public static const const_1916:int = 107;
      
      public static const const_1919:int = 108;
      
      public static const const_1920:int = 109;
      
      public static const const_2049:int = 110;
      
      public static const const_1874:int = 111;
      
      public static const const_2065:int = 112;
      
      public static const const_1951:int = 113;
      
      public static const const_1865:int = 114;
      
      public static const const_2070:int = 115;
      
      public static const const_1982:int = 116;
      
      public static const const_2013:int = 117;
      
      public static const const_1870:int = 118;
      
      public static const const_2019:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1669:
            case const_1516:
               return "banned";
            case const_1501:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
