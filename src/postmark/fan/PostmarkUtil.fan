//
// Copyright (c) 2021, Novant LLC
// Licensed under the MIT License
//
// History:
//   16 Sep 2021  Andy Frank  Creation
//

*************************************************************************
** PostmarkUtil
*************************************************************************

internal const class PostmarkUtil
{
  ** The standard 'Str.toCode` escapes the '$' char which is
  ** an invalid escape sequence for JSON.  So do our own escaping
  ** to make sure its properly formatted.
  static Str escapeStr(Str val)
  {
    // TODO FIXIT
    val.toCode.replace("\\\$", "\$")
  }
}