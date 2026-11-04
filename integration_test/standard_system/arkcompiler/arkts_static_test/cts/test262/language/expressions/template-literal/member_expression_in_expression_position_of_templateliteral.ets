/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: member_expression_in_expression_position_of_templateliteral
// description: MemberExpression in expression position of TemplateLiteral
// (bracket access object["string"] excluded: ESE0250 Object type doesn't have
// proper index access method, verified 2026-08-17; dot member access only)

class MemberObject {
    public num: int = 5;
    public str: string = 'stringValue';
}

function main(): void {
    let obj = new MemberObject();
    arktest.assertEQ(`foo ${obj.num} bar`, 'foo 5 bar', 'number value property');
    arktest.assertEQ(`foo ${obj.str} bar`, 'foo stringValue bar', 'string value property');
}
