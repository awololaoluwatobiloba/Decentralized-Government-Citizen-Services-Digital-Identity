;; Identity Manager Verification Contract
;; Manages and validates government identity managers

(define-constant CONTRACT_OWNER tx-sender)
(define-constant ERR_UNAUTHORIZED (err u100))
(define-constant ERR_ALREADY_EXISTS (err u101))
(define-constant ERR_NOT_FOUND (err u102))

;; Identity manager data structure
(define-map identity-managers
  { manager-id: principal }
  {
    name: (string-ascii 50),
    department: (string-ascii 50),
    is-active: bool,
    created-at: uint
  }
)

;; Track total managers
(define-data-var total-managers uint u0)

;; Add new identity manager (only contract owner)
(define-public (add-identity-manager (manager-id principal) (name (string-ascii 50)) (department (string-ascii 50)))
  (begin
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
    (asserts! (is-none (map-get? identity-managers { manager-id: manager-id })) ERR_ALREADY_EXISTS)
    (map-set identity-managers
      { manager-id: manager-id }
      {
        name: name,
        department: department,
        is-active: true,
        created-at: block-height
      }
    )
    (var-set total-managers (+ (var-get total-managers) u1))
    (ok true)
  )
)

;; Deactivate identity manager
(define-public (deactivate-manager (manager-id principal))
  (begin
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
    (let ((manager-data (unwrap! (map-get? identity-managers { manager-id: manager-id }) ERR_NOT_FOUND)))
      (map-set identity-managers
        { manager-id: manager-id }
        (merge manager-data { is-active: false })
      )
      (ok true)
    )
  )
)

;; Check if manager is authorized
(define-read-only (is-authorized-manager (manager-id principal))
  (match (map-get? identity-managers { manager-id: manager-id })
    manager-data (get is-active manager-data)
    false
  )
)

;; Get manager details
(define-read-only (get-manager-details (manager-id principal))
  (map-get? identity-managers { manager-id: manager-id })
)

;; Get total managers count
(define-read-only (get-total-managers)
  (var-get total-managers)
)
