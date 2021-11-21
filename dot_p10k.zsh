# Powerlevel10k will call instant_prompt_* at the same time as the regular prompt_* function
    # and will record all `p10k segment` calls it makes. When displaying instant prompt, Powerlevel10k
    # will replay these calls without actually calling instant_prompt_*. It is imperative that
    # instant_prompt_* always makes the same `p10k segment` calls regardless of environment. If this
    # rule is not observed, the content of instant prompt will be incorrect.
    #
    # Usually, you should either not define instant_prompt_* or simply call prompt_* from it. If
    # instant_prompt_* is not defined for a segment, the segment won't be shown in instant prompt.
    function instant_prompt_example() {
        # Since prompt_example always makes the same `p10k segment` calls, we can call it from
        # instant_prompt_example. This will give us the same `example` prompt segment in the instant
        # and regular prompts.
        prompt_example
    }
    
    # User-defined prompt segments can be customized the same way as built-in segments.
    typeset -g POWERLEVEL9K_EXAMPLE_FOREGROUND=3
    typeset -g POWERLEVEL9K_EXAMPLE_BACKGROUND=1
    # typeset -g POWERLEVEL9K_EXAMPLE_VISUAL_IDENTIFIER_EXPANSION='⭐'
    
    # Transient prompt works similarly to the builtin transient_rprompt option. It trims down prompt
    # when accepting a command line. Supported values:
    #
    #   - off:      Don't change prompt when accepting a command line.
    #   - always:   Trim down prompt when accepting a command line.
    #   - same-dir: Trim down prompt when accepting a command line unless this is the first command
    #               typed after changing current working directory.
    typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=off
    
    # Instant prompt mode.
    #
    #   - off:     Disable instant prompt. Choose this if you've tried instant prompt and found
    #              it incompatible with your zsh configuration files.
    #   - quiet:   Enable instant prompt and don't print warnings when detecting console output
    #              during zsh initialization. Choose this if you've read and understood
    #              https://github.com/romkatv/powerlevel10k/blob/master/README.md#instant-prompt.
    #   - verbose: Enable instant prompt and print a warning when detecting console output during
    #              zsh initialization. Choose this if you've never tried instant prompt, haven't
    #              seen the warning, or if you are unsure what this all means.
    typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
    
    # Hot reload allows you to change POWERLEVEL9K options after Powerlevel10k has been initialized.
    # For example, you can type POWERLEVEL9K_BACKGROUND=red and see your prompt turn red. Hot reload
    # can slow down prompt by 1-2 milliseconds, so it's better to keep it turned off unless you
    # really need it.
    typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true
    
    # If p10k is already loaded, reload configuration.
    # This works even with POWERLEVEL9K_DISABLE_HOT_RELOAD=true.
    (( ! $+functions[p10k] )) || p10k reload
}

# Tell `p10k configure` which file it should overwrite.
typeset -g POWERLEVEL9K_CONFIG_FILE=${${(%):-%x}:a}

(( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
'builtin' 'unset' 'p10k_config_opts'
