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

  ** To email address for message.
  const Str to

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
    json.add("\"Subject\": ${subject.toCode},")
    if (bodyText != null) json.add("\"TextBody\": ${bodyText.toCode},")
    if (bodyHtml != null) json.add("\"HtmlBody\": ${bodyHtml.toCode},")
    json.add("\"MessageStream\": ${msgStream.toCode}")
    json.add("}")
    return json.toStr
  }
}