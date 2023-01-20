#pragma once

#include "nim.cuh"

typedef struct {
    unsigned int board;
    int alpha, beta, player, plyIndex;
    unsigned char depth, stackIndex, result;
    unsigned char* evaluations;
} StackEntry;

typedef struct {
    unsigned int stackSize;
    StackEntry* array;
} Stack;

__device__ void printResult(unsigned char result);
__device__ void printResultArray(unsigned char* resultArray, unsigned int level);
__device__ void printEntry(StackEntry* entry, unsigned int numRows);

__device__ unsigned char minResultArray(unsigned char results[]);
__device__ unsigned char maxResultArray(unsigned char results[]);

__device__ void stackPush(Stack* stack, unsigned int maxStackSize, unsigned int board, int alpha, int beta, int player, int depth, int plyIndex, int stackIndex, unsigned char evaluations[], unsigned char result);
__device__ void stackPop(Stack* stack, StackEntry* entry);
