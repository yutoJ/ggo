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
renter -> web_renter : register rental\n available schedule
web_renter -> web_rentee : publish

== Rent gadget ==
rentee -> web_rentee : find gadget
loop chat platform
  note over company #98FB98: gadgetとのマッチングに使って欲しい。
  rentee -> web_rentee : ask questions
  renter -> web_rentee : answer
end

rentee -> web_rentee : rental request or make a reservation
note left : Depending on gadget \nwhen renter registers it.

alt Rental request pattern
  note over company: rentee select which pattern when register a gadget.
  rentee -> web_rentee : rental request
  renter --> web_rentee : Approve
else No need approval pattern
  rentee -> web_rentee : make a reservation
  web_rentee --> renter : notify
end

== The day before ==
group pick up a gadget and the procedure
  ship -> renter : send an offcial bag
  note right #FFAAAA : 一旦バッグだけ送って後日また取りに行くと\n貸し手に届くまで時間がかかる。バッグの速達は必要、\nかつすぐ配送してもらえるように促せるか？
  group direct pick up pattern
    ship -> renter : pick up the gadget with the official bag
  end
  group convenience delivery pattern
    renter -> convenience : bring the gadget with the official bag
    convenience <- ship : pick up
  end
end
  ship -> rentee : deliver the gadget

== The day ==
rentee -> rentee : enjoy gadget !!!
group troble
  note over company: can ask questions about the gadget to the rentee,\n and troubles between users to GGO.
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
    convenience <- ship : pick up
  end
end
renter <- ship : return

== The day after ==

rentee -> renter : rental fee, review and thanks messages
renter -> rentee : reply and review for rentee

```

### Appendix

1. 一旦宅配業者と本社は分けて書きました。もう一緒にしてもいいかも
3. pick upの場合、全部 8 amって感じ
4. storeは自社内で保管するということ

### TBD
1. コンビニ経由は高額ガジェットを扱う場合可能か？pick upパターンで行くか？
2. 予約を受けてから希望日までに発送できない可能性があるかも、、
3. 自社で保管するのはありか？毎回pick upは大変だが、platform提供以上にサポートするのはコスト面や柔軟性でデメリットが多いか？
