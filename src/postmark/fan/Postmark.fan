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
** Postmark client.
**
const class Postmark
{
  ** Create a new Postmark API client using given API token.
  new make(Str token)
  {
    this.token = token
  }

  ** Deliver the given message.
  Void deliver(PostmarkMsg msg)
  {
    WebClient? c
    try
    {
      // check for plain email or template
      op := "email"
      if (msg.templateAlias != null) op = "email/withTemplate"

      // setup req
      c = WebClient(`https://api.postmarkapp.com/${op}`)
      c.reqHeaders["Accept"]       = "application/json"
      c.reqHeaders["Content-Type"] = "application/json"
      c.reqHeaders["X-Postmark-Server-Token"] = token

      // write request
      c.reqMethod = "POST"
      c.writeReq
      c.reqOut.print(msg.toJson).close

      // read response
      c.readRes
      if (c.resCode != 200)
      {
        Map m := JsonInStream(c.resIn).readJson
        code  := m["ErrorCode"]
        info  := m["Message"]
        throw IOErr("${code}: ${info}")
      }
    }
    finally { c.close }
  }

  private const Str token
}