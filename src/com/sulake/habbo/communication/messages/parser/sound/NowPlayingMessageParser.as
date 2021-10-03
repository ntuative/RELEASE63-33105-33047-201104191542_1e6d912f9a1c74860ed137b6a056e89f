package com.sulake.habbo.communication.messages.parser.sound
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NowPlayingMessageParser implements IMessageParser
   {
       
      
      private var var_1785:int;
      
      private var _currentPosition:int;
      
      private var var_1786:int;
      
      private var var_1787:int;
      
      private var var_1784:int;
      
      public function NowPlayingMessageParser()
      {
         super();
      }
      
      public function get currentSongId() : int
      {
         return this.var_1785;
      }
      
      public function get currentPosition() : int
      {
         return this._currentPosition;
      }
      
      public function get nextSongId() : int
      {
         return this.var_1786;
      }
      
      public function get nextPosition() : int
      {
         return this.var_1787;
      }
      
      public function get syncCount() : int
      {
         return this.var_1784;
      }
      
      public function flush() : Boolean
      {
         this.var_1785 = -1;
         this._currentPosition = -1;
         this.var_1786 = -1;
         this.var_1787 = -1;
         this.var_1784 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1785 = param1.readInteger();
         this._currentPosition = param1.readInteger();
         this.var_1786 = param1.readInteger();
         this.var_1787 = param1.readInteger();
         this.var_1784 = param1.readInteger();
         return true;
      }
   }
}
