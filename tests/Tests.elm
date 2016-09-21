module Tests exposing (..)

import Test exposing (..)
import Expect
import String
import Csv


all : Test
all =
    describe "Csv tests"
        [ test "split" <|
            \() ->
                Expect.equal
                    [["id", "value"], ["1", "one"], ["2", "two"]] (Csv.split "id,value\n1,one\n2,two\n")
        , test "split" <|
            \() ->
                Expect.equal
                      [["id", "value"], ["1", "one"], ["2", "two"]]
                                (Csv.split
                                "\"id\",\"value\"\n\"1\",\"one\"\n\"2\",\"two\"\n")
        , test "parse" <|
            \() ->
                Expect.equal
                      { headers = ["id", "value"], records = [["1", "one"],
                      ["2", "two"]] }
                                (Csv.parse "id,value\n1,one\n2,two\n")
        , test "parse" <|
            \() ->
                Expect.equal
                      { headers = ["id", "value"], records = [["1", "one"],
                      ["2", "two"]] }
                                (Csv.parse
                                "\"id\",\"value\"\n\"1\",\"one\"\n\"2\",\"two\"\n")
        ]
