
;; A very simple spiltter smart contract where funds are deposited
;; in the contract. After both buyer and seller agreed the funds
;; are transferred to the seller.
;;
;; For more details see docs/escrow.md

;; addresses of buyer, seller and escrow are hard-coded,
;; a new contract is needed for each deal
(define-constant seller 'ST398K1WZTBVY6FE2YEHM6HP20VSNVSSPJTW0D53M)
(define-constant buyer 'ST1JDEC841ZDWN9CKXKJMDQGP5TW1AM10B7EV0DV9)
(define-constant router 'ST398K1WZTBVY6FE2YEHM6HP20VSNVSSPJTW0D53M.router)

;; storage
(define-data-var sellerOk bool false)
(define-data-var buyerOk bool false)
(define-data-var balance uint u0)

;;
(define-map ((type address)) ((amount int)))

;; counter
(define-data-var count int)

;; read-only functions
(define-read-only (get-info)
  {balance: (var-get balance), buyerOk: (var-get buyerOk), sellerOk: (var-get sellerOk)}
)

;; private functions

;; sends the deposited amount to seller or panics, e.g. if not enough funds
(define-private (split-balance)

(var-get input (balance)) 
