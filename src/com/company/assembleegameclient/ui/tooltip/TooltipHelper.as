package com.company.assembleegameclient.ui.tooltip
{
   public class TooltipHelper
   {
      public static const DEFAULT_COLOR:String = "#FFFF8F";
      
      public function TooltipHelper()
      {
         super();
      }
      
      public static function wrapInFontTag(text:String, color:String) : String
      {
         var tagStr:String = "<font color=\"" + color + "\">" + text + "</font>";
         return tagStr;
      }
      
      public static function getFormattedString(value:Number) : String
      {
         var formatted:Number = int((value)*1000)/1000;
         return formatted.toString();
      }
   }
}
