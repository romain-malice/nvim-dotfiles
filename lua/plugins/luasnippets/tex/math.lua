---@diagnostic disable: undefined-global

local in_mathzone = function()
    return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
local GREEK = "alpha|beta|gamma|delta|epsilon|zeta|eta|theta|iota|kappa|lambda|mu|nu|xi|pi|pi|rho|sigma|tau|upsilon|phi|chi|psi|omega|Gamma|Delta|Theta|Lambda|Xi|Pi|Sigma|Upsilon|Phi|Psi|Omega|varepsilon|vartheta|varpi|varrho|varsigma|varphi"

return {}, {
    -- Exponents
    s({ trig = "sr", wordTrig = false }, { t("^{2}") }, { condition = in_mathzone }),
    s({ trig = "cb", wordTrig = false }, { t("^{3}") }, { condition = in_mathzone }),
    s({ trig = "inv", wordTrig = false }, { t("^{-1}") }, { condition = in_mathzone }),

    -- Super/Sub-scripts
    s({ trig = "(" .. GREEK .. "|[%a%)%}%]])([%dijnk])%2", wordTrig = false }, {
            f(function(_, snip)
                return snip.captures[1]
            end),
            t("_{"),
            f(function(_, snip)
                return snip.captures[2]
            end),
            t("}"),
        },
        {condition = in_mathzone}
    ), -- Adding indexes to symbols

    -- Complex
    s({ trig = "conj", wordTrig = false }, { t("^{*}") }, { condition = in_mathzone }),
    s({ trig = "Re", wordTrig = false }, { t("\\mathrm{Re}") }, { condition = in_mathzone }),
    s({ trig = "Im", wordTrig = false }, { t("\\mathrm{Im}") }, { condition = in_mathzone }),

    -- Symbols
    s({ trig = "ooo", wordTrig = false }, { t("\\infty") }, { condition = in_mathzone }),
    s({ trig = "sum", wordTrig = false }, { t("\\sum") }, { condition = in_mathzone }),
    s({ trig = "prod", wordTrig = false }, { t("\\prod") }, { condition = in_mathzone }),
    s({ trig = "+-", wordTrig = false }, { t("\\pm") }, { condition = in_mathzone }),
    s({ trig = "-+", wordTrig = false }, { t("\\mp") }, { condition = in_mathzone }),
    s({ trig = "...", wordTrig = false }, { t("\\dots") }, { condition = in_mathzone }),
    s({ trig = "nabl", wordTrig = false }, { t("\\nabla") }, { condition = in_mathzone }),
    s({ trig = "del", wordTrig = false }, { t("\\nabla") }, { condition = in_mathzone }),
    s({ trig = "xx", wordTrig = false }, { t("\\times") }, { condition = in_mathzone }),
    s({ trig = "**c", wordTrig = false }, { t("\\cdot") }, { condition = in_mathzone }),
    s({ trig = "para", wordTrig = false }, { t("\\parallel") }, { condition = in_mathzone }),
    s({ trig = "ssi", wordTrig = false }, { t("\\Leftrightarrow") }, { condition = in_mathzone }),

    -- Equivalences
    s({ trig = "===", wordTrig = false }, { t("\\equiv") }, { condition = in_mathzone }),
    s({ trig = "!=", wordTrig = false }, { t("\\neq") }, { condition = in_mathzone }),
    s({ trig = ">=", wordTrig = false }, { t("\\geq") }, { condition = in_mathzone }),
    s({ trig = "<=", wordTrig = false }, { t("\\leq") }, { condition = in_mathzone }),
    s({ trig = ">>", wordTrig = false }, { t("\\gg") }, { condition = in_mathzone }),
    s({ trig = "<<", wordTrig = false }, { t("\\ll") }, { condition = in_mathzone }),
    s({ trig = "simm", wordTrig = false }, { t("\\sim") }, { condition = in_mathzone }),
    s({ trig = "sim=", wordTrig = false }, { t("simeq") }, { condition = in_mathzone }),
    s({ trig = "~=", wordTrig = false }, { t("\\approx") }, { condition = in_mathzone }),
    s({ trig = "prop", wordTrig = false }, { t("\\propto") }, { condition = in_mathzone }),

    -- Logic
    s({ trig = "<->", wordTrig = false }, { t("\\leftrightarrow ") }, { condition = in_mathzone }),
    s({ trig = "->", wordTrig = false }, { t("\\to") }, { condition = in_mathzone }),
    s({ trig = "!>", wordTrig = false }, { t("\\mapsto") }, { condition = in_mathzone }),
    s({ trig = "=>", wordTrig = false }, { t("\\implies") }, { condition = in_mathzone }),
    s({ trig = "=<", wordTrig = false }, { t("\\impliedby") }, { condition = in_mathzone }),
    s({ trig = "and", wordTrig = false }, { t("\\cap") }, { condition = in_mathzone }),
    s({ trig = "orr", wordTrig = false }, { t("\\cup") }, { condition = in_mathzone }),
    s({ trig = "exists", wordTrig = false }, { t("\\exists") }, { condition = in_mathzone }),

    -- Sets
    s({ trig = "inn", wordTrig = false }, { t("\\in") }, { condition = in_mathzone }),
    s({ trig = "notin", wordTrig = false }, { t("\\not\\in") }, { condition = in_mathzone }),
    s({ trig = "\\\\\\", wordTrig = false }, { t("\\setminus") }, { condition = in_mathzone }),
    s({ trig = "sub=", wordTrig = false }, { t("\\subseteq") }, { condition = in_mathzone }),
    s({ trig = "sup=", wordTrig = false }, { t("\\supseteq") }, { condition = in_mathzone }),
    s({ trig = "eset", wordTrig = false }, { t("\\emptyset") }, { condition = in_mathzone }),
    s({ trig = "LL", wordTrig = false }, { t("\\mathcal{L}") }, { condition = in_mathzone }),
    s({ trig = "HH", wordTrig = false }, { t("\\mathcal{H}") }, { condition = in_mathzone }),
    s({ trig = "CC", wordTrig = false }, { t("\\mathbb{C}") }, { condition = in_mathzone }),
    s({ trig = "RR", wordTrig = false }, { t("\\mathbb{R}") }, { condition = in_mathzone }),
    s({ trig = "ZZ", wordTrig = false }, { t("\\mathbb{Z}") }, { condition = in_mathzone }),
    s({ trig = "NN", wordTrig = false }, { t("\\mathbb{N}") }, { condition = in_mathzone }),

    -- Integrals
    s({ trig = "oint", wordTrig = false }, { t("\\oint") }, { condition = in_mathzone }),
    s({ trig = "iint", wordTrig = false }, { t("\\iint") }, { condition = in_mathzone }),
    s({ trig = "iiint", wordTrig = false }, { t("\\iiint") }, { condition = in_mathzone }),
}
