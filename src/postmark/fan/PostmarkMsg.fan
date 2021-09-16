//
// Copyright (c) 2021, Novant LLC
// Licensed under the MIT License
//
// History:
//   10 Jan 2021  Andy Frank  Creation
//

using util
using web

**
** PostmarkMsg models a message to deliver for a Postmark client.
**
const class PostmarkMsg
{
  ** It-block constructor.
  new make(|This| f)
  {
    f(this)
  }

  ** From email address for message.
  const Str from

  ** To email address(es) for message.
  const Str to

  ** CC email address(es) for message.
  const Str? cc

  ** BCC email address(es) for message.
  const Str? bcc

  ** Subject for message.
  const Str subject

  ** Text content for message body.
  const Str? bodyText

  ** HTML content for message body.
  const Str? bodyHtml

  ** MessageStream value for message.
  const Str msgStream := "outbound"

  ** Convert message to JSON string.
  Str toJson()
  {
    json := StrBuf()
    json.add("{")
    json.add("\"From\": ${from.toCode},")
    json.add("\"To\": ${to.toCode},")
    if (cc  != null) json.add("\"Cc\": ${cc.toCode},")
    if (bcc != null) json.add("\"Bcc\": ${bcc.toCode},")
    json.add("\"Subject\": ${subject.toCode},")
    if (bodyText != null) json.add("\"TextBody\": ${PostmarkUtil.escapeStr(bodyText)},")
    if (bodyHtml != null) json.add("\"HtmlBody\": ${PostmarkUtil.escapeStr(bodyHtml)},")
    json.add("\"MessageStream\": ${msgStream.toCode}")
    json.add("}")
    return json.toStr
  }
}