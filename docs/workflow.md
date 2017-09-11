```plantuml

actor renter as renter
participant "Web\n(renter)" as web_renter #98FB98
participant "Company" as company
participant "shipping\ncompany" as ship
participant "convenience\nstore" as convenience
participant "Web\n(rentee)" as web_rentee #98FB98
actor rentee as rentee


== Create Account ==
group auth
  renter -> web_renter : register email address (must)
  renter -> web_renter : SMS (must)
  renter -> web_renter : register address (must)
  renter -> web_renter : register bank account \nto receive rentel fee (must)
  renter -> web_renter : profile (must)
  renter -> web_renter : upload photo of Identification card
  note right #FFAAAA : TBD
  renter -> web_renter : SNS facebook and twitter (optional)

end

group auth
  rentee -> web_rentee : register email address (must)
  rentee -> web_rentee : address (must)
  rentee -> web_rentee : SMS (must)
  rentee -> web_rentee : SNS facebook and twitter (optional)
end

== Register gadget ==

renter -> web_renter : register gadget
renter -> company : send gadget
company -> company : check gadget
note right : it's possible to send gadget \nto first rentee after passing gadget check
company -> renter : return gadget
note right #FFAAAA : TBD: with or without official bag
renter -> web_renter : register rental\n available schedule
web_renter -> web_rentee : publish

== Rent gadget ==
rentee -> web_rentee : find gadget
loop chat platform
  rentee -> renter : ask
  renter -> rentee : answer
end

rentee -> web_rentee : rental request or make a reservation
note left : Depending on gadget \nwhen renter registers it.

alt Rental request pattern
  note over company: rentee select which pattern when register a gadget.
  rentee -> web_rentee : rental request
  renter --> rentee : Approve
else No need approval pattern
  rentee -> web_rentee : make a reservation
  web_rentee --> renter : notify
end

== The day before ==
group pick up a gadget and the procedure
  group direct pick up pattern
    ship -> renter : pick up
    note right #FFAAAA : TBD: What procedure\nshould be included?
    ship -> ship : packaging
  end
  group convenience delivery pattern
    renter -> convenience : bring gadget ( without offcial bag)
    convenience -> ship : transfer
    ship -> ship : packaging
  end
end
  ship -> rentee : deliver gadget

== The day ==
rentee -> rentee : enjoy gadget !!!
group troble
  rentee -> company : support request
  rentee -> renter : support request (only chat)
end
== The return day ==
group return
  group direct pick up pattern
    ship -> rentee : pick up
  end
  group convenience delivery pattern
    rentee -> convenience : bring gadget with offcial bag
    convenience -> ship : transfer
  end
end

== The day after ==
company --> renter : notify
renter -> company : select "return" or "store it in company"

alt return
  renter <- ship : return
else store it in company
  company <- ship : store (optional)
  note right : if renter don't want to \nbe picked up in short period)
  company -> company : check returned gadget
  note right : send it to the next rentee.
end

rentee -> renter : rental fee and review
renter -> rentee : reply and review for rentee

```

### Appendix

1. 一旦宅配業者と本社は分けて書きました。もう一緒にしてもいいかも
2. コンビニ経由の場合、バッグってどうするか微妙です。
3. pick upの場合、全部 8 amって感じ
4. storeは自社内で保管するということ

### TBD
1. コンビニ経由は高額ガジェットを扱う場合可能か？pick upパターンで行くか？
2. 予約を受けてから希望日までに発送できない可能性があるかも、、
3. 自社で保管するのはありか？毎回pick upは大変だが、platform提供以上にサポートするのはコスト面や柔軟性でデメリットが多いか？
