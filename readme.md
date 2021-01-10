# Postmark API for Fantom

Native [Fantom](https://fantom.org) API for [Postmark](https://postmarkapp.com).

Usage:

```fantom
pm := Postmark(token)
pm.deliver(PostmarkMsg {
  it.from     = "sender@example.com"
  it.to       = "receiver@example.com"
  it.subject  = "Did this work? asfdsa"
  it.bodyText = "Hello dear Postmark user."
  it.bodyHtml = "<html><body><strong>Hello</strong> dear Postmark user.</body></html>"
})
```