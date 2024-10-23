# SystemWallet

#1 You need run bundle install

Postman FLow:

Last Stock Price:
    PRICE ALL:
        METHOD GET: http://localhost:3000/stock_prices/price_all
    PRICE:
        METHOD GET: http://localhost:3000/stock_prices/price?search="SYMBOL NAME"
    PRICES:
        METHOD GET: http://localhost:3000/stock_prices/prices?symbols="SYMBOLS NAME"

System Wallet:
    USERS: 
        METHOD: POST
        URL: http://localhost:3000/users
        BODY: {
                "user": {
                "name": "",
                "email": "",
                "password": ""
            }
        }
    
    TRANSACTION:
    CREDIT:
        METHOD: POST
        URL: http://localhost:3000/transactions
        BODY: {
            "transaction": {
                "amount": "", #please insert amount what you want
                "transaction_type": "credit", 
                "target_wallet_id": , #you need sign in to get the wallet id
                "user_id": #put your user_id after you sign in
            }
        }

        {
            "transaction": {
                "amount": "", #please insert amount what you want
                "transaction_type": "credit", 
                "source_wallet_id": 2, #this is the sender wallet
                "target_wallet_id": , #tihs is the receiver wallet
                "user_id": #put your user_id after you sign in
            }
        }

        METHOD: POST
        URL: http://localhost:3000/transactions
        DEBIT:
        {
            "transaction": {
                "amount": "", #please insert amount what you want
                "transaction_type": "debit", 
                "source_wallet_id": 2, #this is the sender wallet
                "target_wallet_id": , #tihs is the receiver wallet
                "user_id": #put your user_id after you sign in
            }
        }

    BALANCE:
        MEHTHOD: GET
        URL: http://localhost:3000/wallets/:idwallet/balance

        Response:
        {
            "wallet_id": 9,
            "balance": "0.0",
            "walletable": {
                "id": 6,
                "name": "Fajar Dwi Rianto",
                "type": "User"
            }
        }

