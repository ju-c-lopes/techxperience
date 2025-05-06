import React from "react";
import Navbar from "../components/Navbar";
import Home from "../pages/Home";

export default function BaseLayout() {
    return (
        <div className="min-h-screen bg-white text-gray-900 dark:bg-gray-900 dark:text-gray-100 transition-colors">
            <Navbar />
            <main className="max-w-4xl mx-auto px-4 py-12">
                <Home />
            </main>
            <footer className="w-full text-center text-sm py-6 border-t border-gray-200 dark:border-gray-700">
                <p>
                    © 2025 TechXperience. Desenvolvido por{" "}
                    <a
                        href="https://github.com/ju-c-lopes"
                        className="underline hover:text-blue-600 dark:hover:text-blue-400"
                    >
                        juclops
                    </a>
                </p>
            </footer>
        </div>
    );
}
