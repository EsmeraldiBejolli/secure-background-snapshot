# secure-background-snapshot
Most of us are concerned about the data when using the application or when we lose the phone or still when our phone is locked. You never thought about: What happens when the app is in background, are my data safe? Well, they might be, but this depends on implementation on how we save data and how you use your device.

In the mobile security experience what values most is how users use their phones. Achieving high security is a lifetime partnership between Developers and Users since alone none of them can secure data. Users should be responsible in the way they use their phone and trust on OEM and pay for service instead of tricking the system to get more free stuff as in industrial society nothing will come to. you for free.

Back in our main topic, what happens when we put our mobile app in background?

In IOS when an application is put in background the OS will take a snapshot of the current screen and save it in order to serve real-time app look-like when we open background processes. One more thing to be mentioned is that IOS does not destroy data and ViewController instances when we put app in background as long as Os is not reaching out of memory which we can handle ourself to make a good decision.

    override func didReceiveMemoryWarning() {

        <#code#>

    }




### What is happening inside in black box here?
When your application moves tin background os will take a snapshot of your current view to use it in applications choser that is shown when you hit the home button twice. When Application moves on background the is preferable that application shouldn't do any operation to reserve resources so we IOS itself freeze all ongoing operations and also give us the opportunity to do so by freeing all resources we have allocated on this time like I/O operations save in-progress work etc. Snapshot taken by os will be used instead of keeping the application running and will be deleted after application return to the foreground or closed. Since it is snapshot saved in our device there we get some security implications.

If someone gets access to the device they can extract this snapshot located ...
If we share the device with other people they can easily see this snapshot by double-tapping home button even though they can't open the app because of Biometric verification we have implemented. Secret data snapshotted can still be visible and easily readable. (see image above)


### The solution
IOS offers us the possibility to track when the application is going to background and thus we can take the action to protect particular data to not being snapshotted. We can do this in two ways.

Hide everything by implementing this solution for all screens
Hide only sensitive data by implementing this solution when we think is relevant.
Implementing snapshot data preventing for the entire app:
```
    lazy var imageView : UIImageView = {

        let imgView = UIImageView(frame: window!.frame)

        imgView.image = UIImage(named: "secret")

        return imgView

    }()

    

    func applicationWillResignActive(_ application: UIApplication) {

        self.window?.addSubview(imageView)

    }

    

    func applicationWillEnterForeground(_ application: UIApplication) {

        self.imageView.removeFromSuperview()

    }
   ````
 
Implementing snapshot preventing for the entire app:

    ```
    override func viewDidLoad() {

        super.viewDidLoad()

        // Do any additional setup after loading the view.

       

        

        NotificationCenter.default.addObserver(forName: UIApplication.willResignActiveNotification, object: nil, queue: OperationQueue.main, using: {

            _ in

            print("In Background")

            self.secureView.text = "I replaced secret Content"

        })

        

          NotificationCenter.default.addObserver(forName: UIApplication.didBecomeActiveNotification, object: nil, queue: OperationQueue.main, using: {

                 _ in

                 print("In Background")

            self.secureView.text = "I am very secret content!"

             })

    }




    override func viewWillDisappear(_ animated: Bool) {

        NotificationCenter.default.removeObserver(self)

        super.viewWillDisappear(animated)

    }
    ```
Android implementation is simple and in the same line as IOS so I found trivial to add them both here but if you need any help please reach me out.

Hope this Artice helped you a little on improving security on your own application. In case you need any help or advice please do not hesitate to reach me out.

[Linkedin](https://www.linkedin.com/in/esmeraldi-bejolli/) 

[My Site](http://www.ebejolli.com)
