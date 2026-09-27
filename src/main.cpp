#include "raylib.h"

int main(void)
{
    InitWindow(1280, 720, "raylib example - basic window");

    SetTargetFPS(60);
    while (!WindowShouldClose())
    {
        BeginDrawing();
        ClearBackground(RAYWHITE);
        DrawText("Congrats! You created your first window!", 400, 300, 20, RED);
        EndDrawing();
    }
    CloseWindow();

    return 0;
}
