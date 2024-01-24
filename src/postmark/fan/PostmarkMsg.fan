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
  const Str? subject

  ** Text content for message body.
  const Str? bodyText

  ** HTML content for message body.
  const Str? bodyHtml

  ** List of file attachments.
  const PostmarkFile[] attachments := [,]

  ** Template alias name if using a template.
  const Str? templateAlias

  ** Template model name if using a template.
  const [Str:Obj?]? templateModel

  ** MessageStream value for message.
  const Str msgStream := "outbound"

  ** Convert message to JSON string.
  Str toJson()
  {
    map := Str:Obj?[:]

    map["MessageStream"] = msgStream
    map["From"] = from
    map["To"]   = to

    if (cc   != null) map["Cc"]  = cc
    if (bcc  != null) map["Bcc"] = bcc

    if (subject  != null) map["Subject"]  = subject
    if (bodyText != null) map["TextBody"] = bodyText
    if (bodyHtml != null) map["HtmlBody"] = bodyHtml

    if (attachments.size > 0)
      map["Attachments"] = attachments.map |a| { a.toJson }

    if (templateAlias != null) map["TemplateAlias"] = templateAlias
    if (templateModel != null) map["TemplateModel"] = templateModel

    return JsonOutStream.writeJsonToStr(map)
  }
}