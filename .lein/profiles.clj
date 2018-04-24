{:user {:aliases {"slamhound" ["run" "-m" "slam.hound"]}
        :dependencies [[cljfmt "0.5.7"]
                       [slamhound "1.5.5"]]
        :plugins [[jonase/eastwood "0.2.5"]
                  [lein-ancient "0.6.15"]
                  [lein-bikeshed "0.5.1"]
                  [lein-cljfmt "0.5.7"]
                  [lein-cloverage "1.0.10"]
                  [lein-kibit "0.1.6"]
                  [lein-pprint "1.2.0"]
                  [lein-try "0.4.3"]
                  [venantius/ultra "0.5.2"]
                  [venantius/yagni "0.1.4"]]
        :repl-options {:init (require 'cljfmt.core)}}}
