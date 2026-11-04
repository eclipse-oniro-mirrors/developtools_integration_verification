/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: member_expression_in_expression_position_of_templatemiddlelist_variant_2
// description: MemberExpression in expression position of TemplateMiddleList (one)
// (bracket access object["string"] excluded: ESE0250, verified 2026-08-17)

class MemberObject {
    public num: int = 5;
    public str: string = 'stringValue';
}

function main(): void {
    let obj = new MemberObject();
    arktest.assertEQ(`${0} ${obj.num} bar`, '0 5 bar', 'number value property');
    arktest.assertEQ(`${0} ${obj.str} bar`, '0 stringValue bar', 'string value property');
}
