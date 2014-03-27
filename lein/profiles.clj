{:user
 {:dependencies
  [
   ;; auto completion
   ;; https://github.com/alexander-yakushev/compliment
   [compliment "0.0.3"]
   ;; namespace management based on current buffer contents
   ;; https://github.com/technomancy/slamhound
   [slamhound "1.5.3"]

   [leiningen #=(leiningen.core.main/leiningen-version)]

   ;; This library is required for the way some utilities are
   ;; installed. Or something.
   ;; http://z.caudate.me/give-your-clojure-workflow-more-flow/
   [im.chit/vinyasa "0.1.9"]

   ;; https://github.com/dgrnbrg/spyscope
   ;; Example:
   ;;
   ;; spyscope.repl=> (take 20 (repeat #spy/p (+ 1 2 3)))
   ;; 6
   ;; (6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6)
   [spyscope "0.1.4"]

   ;; Refresh namespaces without restarting the repl
   ;;
   ;; http://thinkrelevance.com/blog/2013/06/04/clojure-workflow-reloaded
   ;; https://github.com/clojure/tools.namespace
   ;;
   ;; Usage: call (refresh) in the repl
   ;;
   ;; TODO check out usage instructions for
   ;; https://github.com/ciderale/quick-reset
   [org.clojure/tools.namespace "0.2.4"]
   ]
  :plugins [[cider/cider-nrepl "0.1.0-SNAPSHOT"]]
  :injections [
               (require '[vinyasa.inject :as inj])
               (inj/inject 'clojure.core
                           '[[vinyasa.inject inject]
                             [vinyasa.pull pull]
                             [vinyasa.lein lein]
                             [vinyasa.reimport reimport]
                             [clojure.tools.namespace.repl refresh]
                             ])

               (require 'spyscope.core)
               ]}}
