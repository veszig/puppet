#
# DO NOT MODIFY!!!!
# This file is automatically generated by racc 1.4.5
# from racc grammer file "grammar.ry".
#
#
# parser.rb: generated by racc (runtime embedded)
#
###### racc/parser.rb begin
unless $LOADED_FEATURES.index 'racc/parser.rb'
$LOADED_FEATURES.push 'racc/parser.rb'

self.class.module_eval <<'..end racc/parser.rb modeval..id5256434e8a', 'racc/parser.rb', 1
#
# $Id: parser.rb,v 1.7 2005/11/20 17:31:32 aamine Exp $
#
# Copyright (c) 1999-2005 Minero Aoki
#
# This program is free software.
# You can distribute/modify this program under the same terms of ruby.
#
# As a special exception, when this code is copied by Racc
# into a Racc output file, you may use that output file
# without restriction.
#

unless defined?(NotImplementedError)
    NotImplementedError = NotImplementError
end

module Racc
    class ParseError < StandardError; end
end
unless defined?(::ParseError)
    ParseError = Racc::ParseError
end

module Racc

    unless defined?(Racc_No_Extentions)
        Racc_No_Extentions = false
    end

    class Parser

        Racc_Runtime_Version = '1.4.5'
        Racc_Runtime_Revision = '$Revision: 1.7 $'.split[1]

        Racc_Runtime_Core_Version_R = '1.4.5'
        Racc_Runtime_Core_Revision_R = '$Revision: 1.7 $'.split[1]
        begin
            require 'racc/cparse'
        # Racc_Runtime_Core_Version_C  = (defined in extention)
            Racc_Runtime_Core_Revision_C = Racc_Runtime_Core_Id_C.split[2]
            unless new.respond_to?(:_racc_do_parse_c, true)
                raise LoadError, 'old cparse.so'
            end
            if Racc_No_Extentions
                raise LoadError, 'selecting ruby version of racc runtime core'
            end

            Racc_Main_Parsing_Routine    = :_racc_do_parse_c
            Racc_YY_Parse_Method         = :_racc_yyparse_c
            Racc_Runtime_Core_Version    = Racc_Runtime_Core_Version_C
            Racc_Runtime_Core_Revision   = Racc_Runtime_Core_Revision_C
            Racc_Runtime_Type            = 'c'
        rescue LoadError
            Racc_Main_Parsing_Routine    = :_racc_do_parse_rb
            Racc_YY_Parse_Method         = :_racc_yyparse_rb
            Racc_Runtime_Core_Version    = Racc_Runtime_Core_Version_R
            Racc_Runtime_Core_Revision   = Racc_Runtime_Core_Revision_R
            Racc_Runtime_Type            = 'ruby'
        end

        def Parser.racc_runtime_type
            Racc_Runtime_Type
        end

        private

        def _racc_setup
            @yydebug = false unless self.class::Racc_debug_parser
            @yydebug = false unless defined?(@yydebug)
            if @yydebug
                @racc_debug_out = $stderr unless defined?(@racc_debug_out)
                @racc_debug_out ||= $stderr
            end
            arg = self.class::Racc_arg
            arg[13] = true if arg.size < 14
            arg
        end

        def _racc_init_sysvars
            @racc_state  = [0]
            @racc_tstack = []
            @racc_vstack = []

            @racc_t = nil
            @racc_val = nil

            @racc_read_next = true

            @racc_user_yyerror = false
            @racc_error_status = 0
        end

        ###
        ### do_parse
        ###

        def do_parse
            __send__(Racc_Main_Parsing_Routine, _racc_setup(), false)
        end

        def next_token
            raise NotImplementedError, "#{self.class}\#next_token is not defined"
        end

        def _racc_do_parse_rb(arg, in_debug)
            action_table, action_check, action_default, action_pointer,
            goto_table,   goto_check,   goto_default,   goto_pointer,
            nt_base,      reduce_table, token_table,    shift_n,
            reduce_n,     use_result,   * = arg

            _racc_init_sysvars
            tok = act = i = nil
            nerr = 0

            catch(:racc_end_parse) {
                while true
                if i = action_pointer[@racc_state[-1]]
                    if @racc_read_next
                        if @racc_t != 0   # not EOF
                            tok, @racc_val = next_token()
                            unless tok      # EOF
                                @racc_t = 0
                            else
                                @racc_t = (token_table[tok] or 1)   # error token
                            end
                            racc_read_token(@racc_t, tok, @racc_val) if @yydebug
                            @racc_read_next = false
                        end
                    end
                    i += @racc_t
                    unless i >= 0 and
                        act = action_table[i] and
                        action_check[i] == @racc_state[-1]
                        act = action_default[@racc_state[-1]]
                    end
                else
                    act = action_default[@racc_state[-1]]
                end
                while act = _racc_evalact(act, arg)
                    ;
                end
            end
            }
        end

        ###
        ### yyparse
        ###

        def yyparse(recv, mid)
            __send__(Racc_YY_Parse_Method, recv, mid, _racc_setup(), true)
        end

        def _racc_yyparse_rb(recv, mid, arg, c_debug)
            action_table, action_check, action_default, action_pointer,
            goto_table,   goto_check,   goto_default,   goto_pointer,
            nt_base,      reduce_table, token_table,    shift_n,
            reduce_n,     use_result,   * = arg

            _racc_init_sysvars
            tok = nil
            act = nil
            i = nil
            nerr = 0

            catch(:racc_end_parse) {
                until i = action_pointer[@racc_state[-1]]
                while act = _racc_evalact(action_default[@racc_state[-1]], arg)
                    ;
                end
            end
            recv.__send__(mid) do |tok, val|
                unless tok
                    @racc_t = 0
                else
                    @racc_t = (token_table[tok] or 1)   # error token
                end
                @racc_val = val
                @racc_read_next = false

                i += @racc_t
                unless i >= 0 and
                    act = action_table[i] and
                    action_check[i] == @racc_state[-1]
                    act = action_default[@racc_state[-1]]
                end
                while act = _racc_evalact(act, arg)
                    ;
                end

                while not (i = action_pointer[@racc_state[-1]]) or
                    not @racc_read_next or
                    @racc_t == 0   # $
                    unless i and i += @racc_t and
                        i >= 0 and
                        act = action_table[i] and
                        action_check[i] == @racc_state[-1]
                    act = action_default[@racc_state[-1]]
                end
                while act = _racc_evalact(act, arg)
                    ;
                end
                end
            end
            }
        end

        ###
        ### common
        ###

        def _racc_evalact(act, arg)
            action_table, action_check, action_default, action_pointer,
            goto_table,   goto_check,   goto_default,   goto_pointer,
            nt_base,      reduce_table, token_table,    shift_n,
            reduce_n,     use_result,   * = arg
            nerr = 0   # tmp

            if act > 0 and act < shift_n
                #
                # shift
                #
                if @racc_error_status > 0
                    @racc_error_status -= 1 unless @racc_t == 1   # error token
                end
                @racc_vstack.push @racc_val
                @racc_state.push act
                @racc_read_next = true
                if @yydebug
                    @racc_tstack.push @racc_t
                    racc_shift @racc_t, @racc_tstack, @racc_vstack
                end

            elsif act < 0 and act > -reduce_n
                #
                # reduce
                #
                code = catch(:racc_jump) {
                    @racc_state.push _racc_do_reduce(arg, act)
                    false
                }
                if code
                    case code
                    when 1 # yyerror
                        @racc_user_yyerror = true   # user_yyerror
                        return -reduce_n
                    when 2 # yyaccept
                        return shift_n
                    else
                        raise '[Racc Bug] unknown jump code'
                    end
                end

            elsif act == shift_n
                #
                # accept
                #
                racc_accept if @yydebug
                throw :racc_end_parse, @racc_vstack[0]

            elsif act == -reduce_n
                #
                # error
                #
                case @racc_error_status
                when 0
                    unless arg[21]    # user_yyerror
                        nerr += 1
                        on_error @racc_t, @racc_val, @racc_vstack
                    end
                when 3
                    if @racc_t == 0   # is $
                        throw :racc_end_parse, nil
                    end
                    @racc_read_next = true
                end
                @racc_user_yyerror = false
                @racc_error_status = 3
                while true
                    if i = action_pointer[@racc_state[-1]]
                        i += 1   # error token
                        if  i >= 0 and
                            (act = action_table[i]) and
                            action_check[i] == @racc_state[-1]
                            break
                        end
                    end
                    throw :racc_end_parse, nil if @racc_state.size <= 1
                    @racc_state.pop
                    @racc_vstack.pop
                    if @yydebug
                        @racc_tstack.pop
                        racc_e_pop @racc_state, @racc_tstack, @racc_vstack
                    end
                end
                return act

            else
                raise "[Racc Bug] unknown action #{act.inspect}"
            end

            racc_next_state(@racc_state[-1], @racc_state) if @yydebug

            nil
        end

        def _racc_do_reduce(arg, act)
            action_table, action_check, action_default, action_pointer,
            goto_table,   goto_check,   goto_default,   goto_pointer,
            nt_base,      reduce_table, token_table,    shift_n,
            reduce_n,     use_result,   * = arg
            state = @racc_state
            vstack = @racc_vstack
            tstack = @racc_tstack

            i = act * -3
            len       = reduce_table[i]
            reduce_to = reduce_table[i+1]
            method_id = reduce_table[i+2]
            void_array = []

            tmp_t = tstack[-len, len] if @yydebug
            tmp_v = vstack[-len, len]
            tstack[-len, len] = void_array if @yydebug
            vstack[-len, len] = void_array
            state[-len, len]  = void_array

            # tstack must be updated AFTER method call
            if use_result
                vstack.push __send__(method_id, tmp_v, vstack, tmp_v[0])
            else
                vstack.push __send__(method_id, tmp_v, vstack)
            end
            tstack.push reduce_to

            racc_reduce(tmp_t, reduce_to, tstack, vstack) if @yydebug

            k1 = reduce_to - nt_base
            if i = goto_pointer[k1]
                i += state[-1]
                if i >= 0 and (curstate = goto_table[i]) and goto_check[i] == k1
                    return curstate
                end
            end
            goto_default[k1]
        end

        def on_error(t, val, vstack)
            raise ParseError, sprintf("\nparse error on value %s (%s)", val.inspect, token_to_str(t) || '?')
        end

        def yyerror
            throw :racc_jump, 1
        end

        def yyaccept
            throw :racc_jump, 2
        end

        def yyerrok
            @racc_error_status = 0
        end

        #
        # for debugging output
        #

        def racc_read_token(t, tok, val)
            @racc_debug_out.print 'read    '
            @racc_debug_out.print tok.inspect, '(', racc_token2str(t), ') '
            @racc_debug_out.puts val.inspect
            @racc_debug_out.puts
        end

        def racc_shift(tok, tstack, vstack)
            @racc_debug_out.puts "shift   #{racc_token2str tok}"
            racc_print_stacks tstack, vstack
            @racc_debug_out.puts
        end

        def racc_reduce(toks, sim, tstack, vstack)
            out = @racc_debug_out
            out.print 'reduce '
            if toks.empty?
                out.print ' <none>'
            else
                toks.each {|t| out.print ' ', racc_token2str(t) }
            end
            out.puts " --> #{racc_token2str(sim)}"

            racc_print_stacks tstack, vstack
            @racc_debug_out.puts
        end

        def racc_accept
            @racc_debug_out.puts 'accept'
            @racc_debug_out.puts
        end

        def racc_e_pop(state, tstack, vstack)
            @racc_debug_out.puts 'error recovering mode: pop token'
            racc_print_states state
            racc_print_stacks tstack, vstack
            @racc_debug_out.puts
        end

        def racc_next_state(curstate, state)
            @racc_debug_out.puts  "goto    #{curstate}"
            racc_print_states state
            @racc_debug_out.puts
        end

        def racc_print_stacks(t, v)
            out = @racc_debug_out
            out.print '        ['
            t.each_index do |i|
                out.print ' (', racc_token2str(t[i]), ' ', v[i].inspect, ')'
            end
            out.puts ' ]'
        end

        def racc_print_states(s)
            out = @racc_debug_out
            out.print '        ['
            s.each {|st| out.print ' ', st }
            out.puts ' ]'
        end

        def racc_token2str(tok)
            self.class::Racc_token_to_s_table[tok] or
                raise "[Racc Bug] can't convert token #{tok} to string"
        end

        def token_to_str(t)
            self.class::Racc_token_to_s_table[t]
        end

    end

end
..end racc/parser.rb modeval..id5256434e8a
end
###### racc/parser.rb end


module Nagios

    class Parser < Racc::Parser

module_eval <<'..end grammar.ry modeval..idcb2ea30b34', 'grammar.ry', 57

class ::Nagios::Parser::SyntaxError < RuntimeError; end

def parse(src)
    @src = src

    # state variables
    @invar = false
    @inobject = false
    @done = false

    @line = 0
    @yydebug = true

    do_parse
end

# The lexer.  Very simple.
def token
    @src.sub!(/\A\n/,'')
    if $MATCH
        @line += 1
        return [ :RETURN, "\n" ]
        end

        if @done
            return nil
        end
        yytext = String.new


        # remove comments from this line
        @src.sub!(/\A[ \t]*;.*\n/,"\n")
        if $MATCH
            return [:INLINECOMMENT, ""]
        end

        @src.sub!(/\A#.*\n/,"\n")
        if $MATCH
            return [:COMMENT, ""]
        end

        @src.sub!(/#.*/,'')

        if @src.length == 0
            @done = true
            return [false, '$']
        end

        if @invar
            @src.sub!(/\A[ \t]+/,'')
            @src.sub!(/\A([^;\n]+)(\n|;)/,'\2')
            if $1
                yytext += $1
                end
                @invar = false
                return [:VALUE, yytext]
        else
            @src.sub!(/\A[\t ]*(\S+)([\t ]*|$)/,'')
        if $1
            yytext = $1
            case yytext
            when 'define'
                #puts "got define"
                return [:DEFINE, yytext]
            when '{'
                #puts "got {"
                @inobject = true
                return [:LCURLY, yytext]
            else
                unless @inobject
                    #puts "got type: #{yytext}"
                    if yytext =~ /\W/
                        giveback = yytext.dup
                        giveback.sub!(/^\w+/,'')
                        #puts "giveback #{giveback}"
                        #puts "yytext #{yytext}"
                        yytext.sub!(/\W.*$/,'')
                        #puts "yytext #{yytext}"
                        #puts "all [#{giveback} #{yytext} #{orig}]"
                        @src = giveback + @src
                    end
                    return [:NAME, yytext]
                else
                    if yytext == '}'
                        #puts "got closure: #{yytext}"
                        @inobject = false
                        return [:RCURLY, '}']
                    end

                    unless @invar
                        @invar = true
                        return [:PARAM, $1]
                    else
                    end
                end
            end
        end
        end
end

def next_token
    token
end

def yydebug
    1
end

def yywrap
    0
end

def on_error(token, value, vstack )
    msg = ""
    unless value.nil?
        msg = "line #{@line}: syntax error at '#{value}'"
        else
            msg = "line #{@line}: syntax error at '#{token}'"
        end
        unless @src.size > 0
            msg = "line #{@line}: Unexpected end of file"
        end
        if token == '$end'.intern
            puts "okay, this is silly"
        else
            raise ::Nagios::Parser::SyntaxError, msg
        end
end
..end grammar.ry modeval..idcb2ea30b34

##### racc 1.4.5 generates ###

racc_reduce_table = [
    0, 0, :racc_error,
    1, 13, :_reduce_1,
    2, 13, :_reduce_2,
    1, 14, :_reduce_3,
    1, 14, :_reduce_4,
    1, 14, :_reduce_none,
    2, 16, :_reduce_6,
    6, 15, :_reduce_7,
    1, 17, :_reduce_none,
    2, 17, :_reduce_9,
    4, 18, :_reduce_10,
    1, 20, :_reduce_none,
    2, 20, :_reduce_none,
    0, 19, :_reduce_none,
    1, 19, :_reduce_none ]

racc_reduce_n = 15

racc_shift_n = 26

racc_action_table = [
    9,    15,     1,    20,     1,    14,    12,    13,    11,     6,
    7,     6,     7,    15,    18,     8,    21,    23,    25 ]

racc_action_check = [
    2,    16,     2,    16,     0,    12,     8,     9,     7,     2,
    2,     0,     0,    14,    15,     1,    18,    22,    24 ]

racc_action_pointer = [
    2,    12,     0,   nil,   nil,   nil,   nil,    -1,     0,     7,
    nil,   nil,    -4,   nil,     8,     6,    -4,   nil,     5,   nil,
    nil,   nil,     8,   nil,     9,   nil ]

racc_action_default = [
    -15,   -15,   -15,    -1,    -3,    -5,    -4,   -15,   -15,   -15,
    -2,    -6,   -15,    26,   -15,   -15,   -15,    -8,   -13,    -9,
    -7,   -14,   -15,   -11,   -10,   -12 ]

racc_goto_table = [ 17,     3,    19,    10,     2,    16,    22,    24 ]

racc_goto_check = [ 6,     2,     6,     2,     1,     5,     7,     8 ]

racc_goto_pointer = [ nil,     4,     1,   nil,   nil,    -9,   -14,   -12,   -15 ]

racc_goto_default = [ nil,   nil,   nil,     4,     5,   nil,   nil,   nil,   nil ]

racc_token_table = {
    false => 0,
    Object.new => 1,
    :DEFINE => 2,
    :NAME => 3,
    :STRING => 4,
    :PARAM => 5,
    :LCURLY => 6,
    :RCURLY => 7,
    :VALUE => 8,
    :RETURN => 9,
    :COMMENT => 10,
    :INLINECOMMENT => 11 }

racc_use_result_var = true

racc_nt_base = 12

Racc_arg = [
    racc_action_table,
    racc_action_check,
    racc_action_default,
    racc_action_pointer,
    racc_goto_table,
    racc_goto_check,
    racc_goto_default,
    racc_goto_pointer,
    racc_nt_base,
    racc_reduce_table,
    racc_token_table,
    racc_shift_n,
    racc_reduce_n,
    racc_use_result_var ]

Racc_token_to_s_table = [
'$end',
'error',
'DEFINE',
'NAME',
'STRING',
'PARAM',
'LCURLY',
'RCURLY',
'VALUE',
'RETURN',
'COMMENT',
'INLINECOMMENT',
'$start',
'decls',
'decl',
'object',
'comment',
'vars',
'var',
'icomment',
'returns']

Racc_debug_parser = false

##### racc system variables end #####

# reduce 0 omitted

module_eval <<'.,.,', 'grammar.ry', 6
    def _reduce_1( val, _values, result )
return val[0] if val[0]
    result
end
.,.,

module_eval <<'.,.,', 'grammar.ry', 18
    def _reduce_2( val, _values, result )
        if val[1].nil?
            result = val[0]
                else
                    if val[0].nil?
                        result = val[1]
                            else
                                result = [ val[0], val[1] ].flatten
                            end
                    end
    result
    end
.,.,

module_eval <<'.,.,', 'grammar.ry', 20
    def _reduce_3( val, _values, result )
result = [val[0]]
    result
end
.,.,

module_eval <<'.,.,', 'grammar.ry', 21
    def _reduce_4( val, _values, result )
result = nil
    result
end
.,.,

# reduce 5 omitted

module_eval <<'.,.,', 'grammar.ry', 25
    def _reduce_6( val, _values, result )
result = nil
    result
end
.,.,

module_eval <<'.,.,', 'grammar.ry', 31
    def _reduce_7( val, _values, result )
        result = Nagios::Base.create(val[1],val[4])
    result
    end
.,.,

# reduce 8 omitted

module_eval <<'.,.,', 'grammar.ry', 40
    def _reduce_9( val, _values, result )
        val[1].each {|p,v|
            val[0][p] = v
                }
                result = val[0]
    result
    end
.,.,

module_eval <<'.,.,', 'grammar.ry', 42
    def _reduce_10( val, _values, result )
result = {val[0],val[1]}
    result
end
.,.,

# reduce 11 omitted

# reduce 12 omitted

# reduce 13 omitted

# reduce 14 omitted

def _reduce_none( val, _values, result )
    result
end

    end   # class Parser

end   # module Nagios
