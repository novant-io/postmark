//
// Copyright (c) 2024, Novant LLC
// Licensed under the MIT License
//
// History:
//   24 Jan 2024  Andy Frank  Creation
//

**
** PostmarkFile models a file attachment for `PostmarkFile`.
**
const class PostmarkFile
{
  ** Create a new file instance from a 'sys::File' instance.
  static new fromFile(File file)
  {
    PostmarkFile(file.name, file.mimeType, file.readAllBuf)
  }

  ** Create a new file instance with given name, MIME type, and content.
  new make(Str name, MimeType mimeType, Buf content)
  {
    this.name     = name
    this.mimeType = mimeType
    this.content  = content
  }

  ** Convert file attachment to JSON.
  internal Str:Obj toJson()
  {
    return Str:Obj[
      "Name": name,
      "ContentType": mimeType.toStr,
      "Content": content.toBase64,
    ]
  }

  // TODO: keep these private for now
  private const Str name
  private const MimeType mimeType
  private const Buf content
}