;;; init-pragmata-pro.el --- Enables beautiful ligatures for Pragmata Pro -*- lexical-binding: t -*-

;; Author: Balaji Sivaraman <balaji@balajisivaraman.com>

;; The MIT License (MIT)

;; Copyright (C) 2017 Balaji Sivaraman

;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:

;; The above copyright notice and this permission notice shall be included in
;; all copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
;; THE SOFTWARE.

;;; Commentary:

;; Enable Ligatures for Pragmata Pro

;;; Code:

;;; Taken from: https://github.com/peel/dotfiles/blob/master/spacemacs/.spacemacs.d/pragpro.el

(defconst pragmatapro-fontlock-keywords-alist
  (mapcar (lambda (regex-char-pair)
            `(,(car regex-char-pair)
              (0 (prog1 ()
                   (compose-region (match-beginning 1)
                                   (match-end 1)
                                   ,(concat (list ?\C-i)
                                            (list (decode-char 'ucs (cadr regex-char-pair)))))))))

          ;; #XE38* -- [ERROR] [DEBUG] [INFO] [WARN] [WARNING] [ERR]
          ;; [FATAL] [TRACE] [FIXME] [TODO] [BUG] [NOTE] [HACK] [MARK]
          '(("\\(\\[ERROR\\]\\)"      #XE380) ; [ E R R O R ]
            ("\\(\\[DEBUG\\]\\)"      #XE381) ; [ D E B U G ]
            ("\\(\\[INFO\\]\\)"       #XE382) ; [ I N F O ]
            ("\\(\\[WARN\\]\\)"       #XE383) ; [ W A R N ]
            ("\\(\\[WARNING\\]\\)"    #XE384) ; [ W A R N I N G ]
            ("\\(\\[ERR\\]\\)"        #XE385) ; [ E R R ]
            ("\\(\\[FATAL\\]\\)"      #XE386) ; [ F A T A L ]
            ("\\(\\[TRACE\\]\\)"      #XE387) ; [ T R A C E ]
            ("\\(\\[FIXME\\]\\)"      #XE388) ; [ F I X M E ]
            ("\\(\\[TODO\\]\\)"       #XE389) ; [ T O D O ]
            ("\\(\\[BUG\\]\\)"        #XE38A) ; [ B U G ]
            ("\\(\\[NOTE\\]\\)"       #XE38B) ; [ N O T E ]
            ("\\(\\[HACK\\]\\)"       #XE38C) ; [ H A C K ]
            ("\\(\\[MARK\\]\\)"       #XE38D) ; [ M A R K ]

            ;; #XE90* -- !! != !== !!! !≡ !≡≡ !> >!=
            ("\\(!!\\)"               #XE900) ; ! !
            ("\\(!=\\)"               #XE901) ; ! =
            ("\\(!==\\)"              #XE902) ; ! = =
            ("\\(!!!\\)"              #XE903) ; ! ! !
            ("\\(!≡\\)"               #XE904) ; ! ≡
            ("\\(!≡≡\\)"              #XE905) ; ! ≡ ≡
            ("\\(!>\\)"               #XE906) ; ! >
            ("\\(>!=\\)"              #XE907) ; > ! =

            ;; #XE92* -- #( #_ #{ #? #> ###_
            ("\\(#(\\)"               #XE920) ; # (
            ("\\(#_\\)"               #XE921) ; # _
            ("\\(#{\\)"               #XE922) ; # {
            ("\\(#\\?\\)"             #XE923) ; # ?
            ("\\(#>\\)"               #XE924) ; # >
            ("\\(##\\)"               #XE925) ; # #
            ("\\(#_(\\)"              #XE926) ; # _ (

            ;; #XE93* -- %= %> %>% %<% <~
            ("\\(%=\\)"               #XE930) ; % =
            ("[^<]\\(%>\\)"           #XE931) ; % >
            ("[^<]\\(%>%\\)"          #XE932) ; % > %
            ;; [NOTE] #XE933 %<% is after #XE9D7
            ("\\(<~\\)"               #XE93F) ; < ~

            ;; #XE94* -- &% && &* &+ &- &/ &= &&& &>
            ("\\(&%\\)"               #XE940) ; & %
            ("\\(&&\\)"               #XE941) ; & &
            ("\\(&\\*\\)"             #XE942) ; & *
            ("\\(&\\+\\)"             #XE943) ; & +
            ("\\(&-\\)"               #XE944) ; & -
            ("\\(&/\\)"               #XE945) ; & \
            ("\\(&=\\)"               #XE946) ; & =
            ("\\(&&&\\)"              #XE947) ; & & &
            ("\\(&>\\)"               #XE948) ; & >

            ;; #XE96* -- *** *= */ *>
            ;; ("\\(\\*\\*\\*\\)"        #XE960) ; * * *
            ("\\(\\*=\\)"             #XE961) ; * =
            ("\\(\\*/\\)"             #XE962) ; * /
            ("[^<]\\(\\*>\\)"         #XE963) ; * >

            ;; #XE97* -- ++ +++ += +> ++=
            ("\\(\\+\\+\\)"           #XE970) ; + +
            ("\\(\\+\\+\\+\\)"        #XE971) ; + + +
            ("[^\\+]\\(\\+=\\)"       #XE972) ; + =
            ("[^<]\\(\\+>\\)"         #XE973) ; + >
            ("\\(\\+\\+=\\)"          #XE974) ; + + =

            ;; #XE98* -- -- -< -<< -= -> ->> --- --> -+- -\/ -|> -<|
            ("\\(--\\)"               #XE980) ; - -
            ("[^-]\\(-<\\)"           #XE981) ; - <
            ("\\(-<<\\)"              #XE982) ; - < <
            ("\\(-=\\)"               #XE983) ; - =
            ("[^|]\\(->\\)"           #XE984) ; - >
            ("[^|]\\(->>\\)"          #XE985) ; - > >
            ("\\(---\\)"              #XE986) ; - - -
            ("\\(-->\\)"              #XE987) ; - - >
            ("\\(-\\+-\\)"            #XE988) ; - + -
            ("\\(-\\\\/\\)"           #XE989) ; - \ /
            ;; [NOTE] #XE98A -|> is after #XEA62
            ;; [NOTE] #XE98B -<| is after #XE9CD

            ;; #XE99* -- .. ... ..< .> .~ .=
            ("[^\\^]\\(\\.\\.\\)"     #XE990) ; . .
            ("\\(\\.\\.\\.\\)"        #XE991) ; . . .
            ("\\(\\.\\.<\\)"          #XE992) ; . . <
            ("\\(\\.>\\)"             #XE993) ; . >
            ("\\(\\.~\\)"             #XE994) ; . ~
            ("\\(\\.=\\)"             #XE995) ; . =

            ;; #XE9A* -- /* // /> /= /== /// /**
            ("\\(/\\*\\)"             #XE9A0) ; / *
            ("\\(//\\)"               #XE9A1) ; / /
            ("[^<]\\(/>\\)"           #XE9A2) ; / >
            ("[^=]\\(/=\\)"           #XE9A3) ; / =
            ("\\(/==\\)"              #XE9A4) ; / = =
            ("\\(///\\)"              #XE9A5) ; / / /
            ("\\(/\\*\\*\\)"          #XE9A6) ; / * *

            ;; #XE9B* -- :: := :≡ :> :=> :(:-(:) :-) :/ :\ :3 :D :P :>: :<:
            ("\\(::\\)"               #XE9B0) ; : :
            ("\\(:=\\)"               #XE9B1) ; : =
            ("[^≡]\\(:≡\\)"           #XE9B2) ; : ≡
            ("\\(:>\\)"               #XE9B3) ; : >
            ("\\(:=>\\)"              #XE9B4) ; : = >
            ("\\(:(\\)"               #XE9B5) ; : (
            ("\\(:-(\\)"              #XE9B6) ; : - (
            ("\\(:)\\)"               #XE9B7) ; : )
            ("\\(:-)\\)"              #XE9B8) ; : - )
            ("\\(:/\\)"               #XE9B9) ; : /
            ("\\(:\\\\\\)"            #XE9BA) ; : \
            ("\\(:3\\)"               #XE9BB) ; : 3
            ("\\(:D\\)"               #XE9BC) ; : D
            ("\\(:P\\)"               #XE9BD) ; : P
            ("\\(:>:\\)"              #XE9BE) ; : > :
            ;; [NOTE] #XE9BF :<: is after #XE9EE

            ;; #XE9C* -- <$> <* <*> <+> <- << <<< <<= <= <=> <> <|> <<- <| <=< <~
            ("\\(<\\*\\)"             #XE9C1) ; < *
            ("\\(<\\*>\\)"            #XE9C2) ; < * >
            ;; [NOTE] #XE9C3 <+> is after #XE9D3
            ("[^<]\\(<-\\)"           #XE9C4) ; < -
            ("[^-]\\(<<\\)"           #XE9C5) ; < <
            ("\\(<<<\\)"              #XE9C6) ; < < <
            ("\\(<<=\\)"              #XE9C7) ; < < =
            ("[^<]\\(<=\\)"           #XE9C8) ; < =
            ("\\(<=>\\)"              #XE9C9) ; < = >
            ;; [NOTE] #XE9C0 <$> is after #XE9D2
            ("\\(<>\\)"               #XE9CA) ; < >
            ;; [NOTE] #XE9CB <|> is after #XE9CD
            ("\\(<<-\\)"              #XE9CC) ; < < -
            ("\\(<|\\)"               #XE9CD) ; < |
            ("\\(-<|\\)"              #XE98B) ; - < | [NOTE] out of order
            ("\\(<|>\\)"              #XE9CB) ; < | > [NOTE] out of order
            ("\\(<=<\\)"              #XE9CE) ; < = <
            ("[^<]\\(<~\\)"           #XE9CF) ; < ~

            ;; #XE9D* -- <~~ <<~ <$ <+ <!> <@> <#> <%> <^> <&> <?> <.> </> <\> <"> <:>
            ("\\(<~~\\)"              #XE9D0) ; < ~ ~
            ("\\(<<~\\)"              #XE9D1) ; < < ~
            ("\\(<\\$\\)"             #XE9D2) ; < $
            ;; [NOTE] #XE9D4 <!> is after #XE9E3
            ;; [NOTE] #XE9D5 <@> is after #XEA57
            ;; [NOTE] #XE9D6 <#> is after #XE9E5
            ;; [NOTE] #XE9D7 <%> is after #XE9E6
            ;; [NOTE] #XE9D8 <^> is after #XEA4E
            ;; [NOTE] #XE9D9 <&> is after #XE9E8
            ;; [NOTE] #XE9DA <?> is after #XEA43
            ;; [NOTE] #XE9DB <.> is after #XE9EA
            ;; [NOTE] #XE9DC </> is after #XE9EB
            ("\\(<\\$>\\)"            #XE9C0) ; < $ > [NOTE] out of order
            ("\\(<\\+\\)"             #XE9D3) ; < +
            ;; [NOTE] #XE9DD <\> is after #XE9EC
            ;; [NOTE] #XE9DE <"> is after #XEA90
            ;; [NOTE] #XE9DF <:> is after #XE9EE
            ("\\(<\\+>\\)"            #XE9C3) ; < + > [NOTE] out of order

            ;; #XE9E* -- <~> <**> <<^ <! <@ <#<% <^ <& <? <. </ <\ <" <: <->
            ("\\(<~>\\)"              #XE9E0) ; < ~ >
            ("\\(<\\*\\*>\\)"         #XE9E1) ; < * * >
            ("\\(<<\\^\\)"            #XE9E2) ; < < ^
            ("\\(<!\\)"               #XE9E3) ; < !
            ("\\(<!>\\)"              #XE9D4) ; < ! > [NOTE] out of order
            ("\\(<@\\)"               #XE9E4) ; < @
            ("\\(<#\\)"               #XE9E5) ; < #
            ("\\(<#>\\)"              #XE9D6) ; < # > [NOTE] out of order
            ("\\(<%\\)"               #XE9E6) ; < %
            ("\\(<%>\\)"              #XE9D7) ; < % > [NOTE] out of order
            ("\\(%<%\\)"              #XE933) ; % < % [NOTE] out of order
            ("[^<]\\(<\\^\\)"         #XE9E7) ; < ^
            ("\\(<&\\)"               #XE9E8) ; < &
            ("\\(<&>\\)"              #XE9D9) ; < & > [NOTE] out of order
            ("\\(<\\?\\)"             #XE9E9) ; < ?
            ("\\(<\\.\\)"             #XE9EA) ; < .
            ("\\(<\\.>\\)"            #XE9DB) ; < . > [NOTE] out of order
            ("\\(</\\)"               #XE9EB) ; < /
            ("\\(</>\\)"              #XE9DC) ; < / > [NOTE] out of order
            ("\\(<\\\\\\)"            #XE9EC) ; < \
            ("\\(<\\\\>\\)"           #XE9DD) ; < \ > [NOTE] out of order
            ("\\(<\"\\)"              #XE9ED) ; < "
            ("\\(<:\\)"               #XE9EE) ; < :
            ("\\(<:>\\)"              #XE9DF) ; < : > [NOTE] out of order
            ("\\(:<:\\)"              #XE9BF) ; : < : [NOTE] out of order
            ("\\(<->\\)"              #XE9EF) ; < - >

            ;; #XE9F* -- <!-- <-- <~< <==>
            ("\\(<!--\\)"             #XE9F0) ; < ! - -
            ("\\(<--\\)"              #XE9F1) ; < - -
            ("\\(<~<\\)"              #XE9F2) ; < ~ <
            ("\\(<==>\\)"             #XE9F3) ; < = = >

            ;; #XEA0* -- ==< == === ==> => =~ =>> =/=
            ("\\(==<\\)"              #XEA00) ; = = <
            ("[^/!<=>]\\(==\\)[^><=]" #XEA01) ; = =
            ("\\(===\\)"              #XEA02) ; = = =
            ("[^<]\\(==>\\)"          #XEA03) ; = = >
            ("[^=:<]\\(=>\\)"         #XEA04) ; = >
            ("\\(=~\\)"               #XEA05) ; = ~
            ("\\(=>>\\)"              #XEA06) ; = > >
            ("\\(=/=\\)"              #XEA07) ; = / =

            ;; #XEA1* -- ≡≡ ≡≡≡ ≡:≡
            ("[^!]\\(≡≡\\)"           #XEA10) ; ≡ ≡
            ("\\(≡≡≡\\)"              #XEA11) ; ≡ ≡ ≡
            ("\\(≡:≡\\)"              #XEA12) ; ≡ : ≡

            ;; #XEA2* -- >- >= >> >>- >== >>> >=> >>^
            ("[^>]\\(>-\\)"           #XEA20) ; > -
            ("\\(>=\\)"               #XEA21) ; > =
            ("[^=-]\\(>>\\)"          #XEA22) ; > >
            ("\\(>>-\\)"              #XEA23) ; > > -
            ("\\(>==\\)"              #XEA24) ; > = =
            ("\\(>>>\\)"              #XEA25) ; > > >
            ("\\(>=>\\)"              #XEA26) ; > = >
            ("\\(>>\\^\\)"            #XEA27) ; > > ^

            ;; #XEA4* -- ?? ?~ ?= ?> ??? ^= ^. ^? ^.. ^<< ^>> ^>
            ("\\(\\?\\?\\)"           #XEA40) ; ? ?
            ("\\(\\?~\\)"             #XEA41) ; ? ~
            ("\\(\\?=\\)"             #XEA42) ; ? =
            ("\\(\\?>\\)"             #XEA43) ; ? >
            ("\\(<\\?>\\)"            #XE9DA) ; < ? > [NOTE] out of order
            ("\\(\\?\\?\\?\\)"        #XEA44) ; ? ? ?
            ("\\(\\^=\\)"             #XEA48) ; ^ =
            ("\\(\\^\\.\\)"           #XEA49) ; ^ .
            ("\\(\\^\\?\\)"           #XEA4A) ; ^ ?
            ("\\(\\^\\.\\.\\)"        #XEA4B) ; ^ . .
            ("\\(\\^<<\\)"            #XEA4C) ; ^ < <
            ;; [NOTE] #XEA4D ^>> is after #XEA4E
            ("\\(\\^>\\)"             #XEA4E) ; ^ >
            ("\\(\\^>>\\)"            #XEA4D) ; ^ > > [NOTE] out of order
            ("\\(<\\^>\\)"            #XE9D8) ; < ^ > [NOTE] out of order

            ;; #XEA5* -- \\ \> \/- @>
            ("[^\\\\]\\(\\\\\\\\\\)"  #XEA50) ; \ \ \ \
            ("[^<]\\(\\\\>\\)"        #XEA51) ; \ \ >
            ("\\(\\\\/-\\)"           #XEA52) ; \ / -
            ("\\(@>\\)"               #XEA57) ; @ >
            ("\\(<@>\\)"              #XE9D5) ; < @ > [NOTE] out of order

            ;; #XEA6* -- |= || |> ||| |+| |-> |--> |=> |==>
            ("\\(|=\\)"               #XEA60) ; | =
            ("\\(||\\)"               #XEA61) ; | |
            ("[^<]\\(|>\\)"           #XEA62) ; | >
            ("\\(-|>\\)"              #XE98A) ; - | > [NOTE] out of order
            ("\\(|||\\)"              #XEA63) ; | | |
            ("\\(|\\+|\\)"            #XEA64) ; | + |
            ("\\(|->\\)"              #XEA65) ; | - >
            ("\\(|-->\\)"             #XEA66) ; | - - >
            ("\\(|=>\\)"              #XEA67) ; | = >
            ("\\(|==>\\)"             #XEA68) ; | = = >

            ;; #XEA7* -- ~= ~> ~~> ~>>
            ("\\(~=\\)"               #XEA70) ; ~ =
            ("[^~<]\\(~>\\)"          #XEA71) ; ~ >
            ("\\(~~>\\)"              #XEA72) ; ~ ~ >
            ("\\(~>>\\)"              #XEA73) ; ~ > >

            ;; #XEA9* -- ">
            ("\\(\">\\)"              #XEA90) ; " >
            ("\\(<\">\\)"             #XE9DE) ; < " > [NOTE] out of order
            )))

(defun add-pragmatapro-symbol-keywords ()
  (font-lock-add-keywords nil pragmatapro-fontlock-keywords-alist))

(add-hook 'prog-mode-hook
          #'add-pragmatapro-symbol-keywords)

(provide 'init-pragmata-pro)
;;; init-pragmata-pro.el ends here
