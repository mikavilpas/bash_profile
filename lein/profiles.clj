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

   ;; https://github.com/AvisoNovate/pretty
   [io.aviso/pretty "0.1.8"]

   ;; Ad-hoc simple debugging
   ;; http://dev.solita.fi/2014/03/18/pimp-my-repl.html
   ;; Now insert (>debug-repl) anywhere in your code. When the
   ;; execution hits that point, it's given over to the REPL. Once
   ;; you're done, enter (), and the regular execution is resumed.
   [org.clojars.gjahad/debug-repl "0.3.3"]
   [midje "1.6.3"]
   ]
  :plugins [[cider/cider-nrepl "0.7.0"]]
  :injections [(require '[vinyasa.inject :as inj])
               (inj/inject 'clojure.core
                           '[[vinyasa.inject inject]
                             [vinyasa.pull pull]
                             [vinyasa.lein lein]
                             [vinyasa.reimport reimport]
                             [clojure.tools.namespace.repl refresh]
                             [clojure.pprint [pprint >pprint]]
                             ])

               (require 'spyscope.core)

               ;; http://z.caudate.me/give-your-clojure-workflow-more-flow/
               ;; The best stacktrace output library is pretty. We
               ;; replace the old stacktrace library with the pretty
               ;; version using this:
               (require 'io.aviso.repl 
                        'clojure.repl 
                        'clojure.main)

               (alter-var-root #'clojure.main/repl-caught
                               (constantly @#'io.aviso.repl/pretty-pst))
               (alter-var-root #'clojure.repl/pst
                               (constantly @#'io.aviso.repl/pretty-pst))

               ;; debug-repl
               (require 'alex-and-georges.debug-repl)
               (vinyasa.inject/inject 'clojure.core '>
                                      '[[alex-and-georges.debug-repl debug-repl]])]
  ;; Use pretty printing in the leiningen repl always
  ;; https://github.com/AvisoNovate/pretty
  :repl-options {:nrepl-middleware
                 [io.aviso.nrepl/pretty-middleware]}}}
