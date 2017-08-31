{:user {:aliases {"slamhound" ["run" "-m" "slam.hound"]}
        :dependencies [[cljfmt "0.5.7"]
                       [slamhound "1.5.5"]]
        :plugins [[jonase/eastwood "0.2.4"]
                  [lein-ancient "0.6.10"]
                  [lein-bikeshed "0.4.1"]
                  [lein-cljfmt "0.5.7"]
                  [lein-cloverage "1.0.9"]
                  [lein-kibit "0.1.5"]
                  [lein-pprint "1.1.2"]
                  [lein-try "0.4.3"]
                  [venantius/ultra "0.5.1"]
                  [venantius/yagni "0.1.4"]]
        :repl-options {:init (require 'cljfmt.core)}}}
