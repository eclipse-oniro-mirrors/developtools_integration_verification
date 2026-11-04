/*
* Copyright (c) 2021-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/
/**
 * @id STMT_08_12_013_RUNTIME_return_subclass_assignable_to_base
 * @expect runtime
 * @section 8.12
 * @design 运行时验证return子类对象给父类返回类型的动态多态行为
 * @note 运行时测试：验证通过基类引用访问子类属性与方法，确认返回的是实际的子类实例
 */

class Shape {
    public label: string;
    constructor(label: string) {
        this.label = label;
    }
    describe(): string {
        return "Shape:" + this.label;
    }
}

class Circle extends Shape {
    public radius: number;
    constructor(label: string, radius: number) {
        super(label);
        this.radius = radius;
    }
    describe(): string {
        return "Circle:" + this.label + " r=" + this.radius.toString();
    }
}

class Square extends Shape {
    public side: number;
    constructor(label: string, side: number) {
        super(label);
        this.side = side;
    }
    describe(): string {
        return "Square:" + this.label + " s=" + this.side.toString();
    }
}

function makeShape(kind: string): Shape {
    if (kind == "circle") {
        return new Circle("c1", 5);
    } else {
        return new Square("s1", 3);
    }
}

function main(): void {
    let s1: Shape = makeShape("circle");
    if (s1.describe() != "Circle:c1 r=5") {
        throw new Error("Expected Circle:c1 r=5, got " + s1.describe());
    }

    let s2: Shape = makeShape("square");
    if (s2.describe() != "Square:s1 s=3") {
        throw new Error("Expected Square:s1 s=3, got " + s2.describe());
    }

    console.log("verified");
}
