func runDeinitializationExamples() {
    // ==================================================
    // HOW DEINITIALIZATION WORKS
    // ==================================================
    class BankAccount {
        let accountNumber: String // Hesap numarası özelliği
        var balance: Double // Hesap bakiyesi özelliği

        init(accountNumber: String, initialDeposit: Double) {
            self.accountNumber = accountNumber // Hesap numarası atanır
            self.balance = initialDeposit // Başlangıç bakiyesi atanır
            print("Account \(accountNumber) created with initial balance \(balance)") // Hesap oluşturuldu mesajı
        }

        func deposit(amount: Double) {
            balance += amount // Para yatırıldığında bakiye artırılır
            print("Deposited \(amount). New balance: \(balance)") // Yeni bakiye gösterilir
        }

        func withdraw(amount: Double) {
            balance -= amount // Para çekildiğinde bakiye azaltılır
            print("Withdrew \(amount). New balance: \(balance)") // Yeni bakiye gösterilir
        }

        deinit {
            // Deinitializer, sınıfın örneği hafızadan silinmeden hemen önce çağrılır
            print("Account \(accountNumber) is being closed.") // Hesap kapanışı mesajı
        }
    }

    // ==================================================
    // DEINITIALIZERS IN ACTION
    // ==================================================
    var account: BankAccount? = BankAccount(accountNumber: "12345678", initialDeposit: 500.0)
    // Hesap oluşturulur ve başlangıç bakiyesi atanır
    account?.deposit(amount: 200.0) // Hesaba para yatırılır
    account?.withdraw(amount: 100.0) // Hesaptan para çekilir
    account = nil // Referans kaldırılır, deinitializer çağrılır
}

/*
SUMMARY:
Bu kod, Swift'teki deinitialization (yok edici) mekanizmasını ve sınıfların bellekteki ömür döngüsünü anlamak için bir örnek sağlar.

1. **How Deinitialization Works:**
   - `BankAccount` sınıfı, bir hesap numarası ve bakiye gibi özelliklere sahiptir.
   - `deinit` metodu, sınıfın bir örneği bellekteki yaşam döngüsünü tamamladığında (yani referans sayısı sıfırlandığında) çağrılır.
   - Deinitializer, örneğin bellekte serbest bırakılmadan hemen önce özel bir temizlik işlemi yapmak için kullanılır.

2. **Deinitializers in Action:**
   - `account` adında bir `BankAccount` nesnesi oluşturulur.
   - Bu nesne üzerinden para yatırma (`deposit`) ve para çekme (`withdraw`) işlemleri gerçekleştirilir.
   - `account = nil` ifadesiyle referans kaldırıldığında, deinitializer (`deinit`) otomatik olarak çağrılır ve kaynak serbest bırakılır.

Deinitialization, sınıf örneklerinin kullanımı tamamlandıktan sonra gerekli temizleme işlemlerinin yapılması için önemlidir. Örneğin, dosya kapanışı, ağ bağlantısının kesilmesi veya bellekte yer alan diğer kaynakların serbest bırakılması gibi işlemler burada gerçekleştirilebilir.
*/