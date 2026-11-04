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
 * @id STMT_08_13_021_RUNTIME_enum_switch
 * @expect runtime
 * @section 8.13
 * @design 运行时验证enum类型switch表达式的case精确匹配、default兜底、fall-through穿透枚举分支
 * @note 验证三个场景：枚举成员精确匹配、未匹配时default执行、fall-through无break穿透到下一枚举分支
 */
enum Direction {
    NORTH,
    SOUTH,
    EAST,
    WEST
}

enum Status {
    NONE = 0,
    ACTIVE = 1,
    PENDING = 2,
    DONE = 3
}

function main(): void {
    // Test 1: exact enum case match
    let dir: Direction = Direction.NORTH;
    let result: string = "";
    switch (dir) {
        case Direction.NORTH:
            result = "north";
            break;
        case Direction.SOUTH:
            result = "south";
            break;
        case Direction.EAST:
            result = "east";
            break;
        case Direction.WEST:
            result = "west";
            break;
        default:
            result = "unknown_dir";
            break;
    }
    if (result != "north") {
        throw new Error("Enum case match failed: expected 'north', got " + result);
    }

    // Test 2: no match falls to default
    let dir2: Direction = Direction.EAST;
    let result2: string = "";
    switch (dir2) {
        case Direction.NORTH:
            result2 = "north";
            break;
        case Direction.SOUTH:
            result2 = "south";
            break;
        default:
            result2 = "default_dir";
            break;
    }
    if (result2 != "default_dir") {
        throw new Error("Enum default not reached: expected 'default_dir', got " + result2);
    }

    // Test 3: enum fall-through (no break in first case)
    let dir3: Direction = Direction.WEST;
    let result3: string = "";
    switch (dir3) {
        case Direction.NORTH:
            result3 = "north_fall";
        case Direction.WEST:
            result3 = result3 + "_west_hit";
            break;
        default:
            result3 = "default_hit";
            break;
    }
    if (result3 != "_west_hit") {
        throw new Error("Enum fall-through failed: expected '_west_hit', got " + result3);
    }

    // Test 4: explicit-value enum case match
    let s: Status = Status.PENDING;
    let result4: string = "";
    switch (s) {
        case Status.NONE:
            result4 = "none";
            break;
        case Status.ACTIVE:
            result4 = "active";
            break;
        case Status.PENDING:
            result4 = "pending";
            break;
        case Status.DONE:
            result4 = "done";
            break;
        default:
            result4 = "unknown_status";
            break;
    }
    if (result4 != "pending") {
        throw new Error("Explicit-value enum case match failed: expected 'pending', got " + result4);
    }

    console.log("verified");
}
