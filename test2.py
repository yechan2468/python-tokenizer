import sys
import heapq
import math

# initialize variables
v, e, turning_point = map(int, sys.stdin.readline().split())
# reversed graph is needed, because round trip distances are what we want to get
graph = [[] for _ in range(v+1)]
reversed_graph = [[] for _ in range(v+1)]
for _ in range(e):
    start, end, weight = map(int, sys.stdin.readline().split())
    graph[start].append((end, weight))
    reversed_graph[end].append((start, weight))


def dijkstra(graph, turning_point):
    visited = [False for _ in range(len(graph))]
    pqueue = [(0, turning_point)]
    heapq.heapify(pqueue)
    distances = [math.inf for _ in range(len(graph))]
    distances[turning_point] = 0
    while pqueue:
        _, current_node = heapq.heappop(pqueue)
        if visited[current_node]:
            continue
        visited[current_node] = True
        for next_node, weight in graph[current_node]:
            if distances[current_node]+weight < distances[next_node]:
                distances[next_node] = distances[current_node]+weight
                heapq.heappush(pqueue, (distances[next_node], next_node))
    return distances[1:]


# apply dijkstra's algorithm twice
# node -> turning point, turning point -> node
distances_go = dijkstra(reversed_graph, turning_point)
distances_back = dijkstra(graph, turning_point)

# print answer: the maximum round trip distance
result = 0
for i in range(v):
    result = max(result, distances_go[i]+distances_back[i])
print(result)
